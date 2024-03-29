/*
 * Copyright (C) 2019  SCS Lab <scs-help@cs.iit.edu>, Hariharan
 * Devarajan <hdevarajan@hawk.iit.edu>, Anthony Kougkas
 * <akougkas@iit.edu>, Xian-He Sun <sun@iit.edu>
 *
 * This file is part of Labios
 *
 * Labios is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program.  If not, see
 * <http://www.gnu.org/licenses/>.
 */
/******************************************************************************
 *include files
 ******************************************************************************/
#include <algorithm>
#include <labios/common/solver/simple_solver.h>
#include <labios/labios_system.h>

/******************************************************************************
 *Interface
 ******************************************************************************/
solver_output SimplSolver::solve(solver_input input) {
  int *worker_score;
  int64_t *worker_capacity;
  int *worker_energy;
  worker_score = new int[MAX_WORKER_COUNT];
  worker_capacity = new int64_t[MAX_WORKER_COUNT];
  worker_energy = new int[MAX_WORKER_COUNT];
  int solver_index = 0, static_index = 0, actual_index = 0;
  auto static_task_map = std::unordered_map<int, int>();

  // scchedule the predefined destination lables
  for (auto task_t : input.tasks) {
    switch (task_t->t_type) {
    case task_type::WRITE_TASK: {
      auto *wt = reinterpret_cast<write_task *>(task_t);
      if (wt->destination.worker == -1) {
        solver_task_map.emplace(actual_index, solver_index);
        input.task_size[solver_index] = wt->source.size;
        solver_index++;
      } else {
        /*
         * update existing file
         */
        static_task_map.emplace(actual_index, wt->destination.worker);
        static_index++;
      }
      break;
    }
    case task_type::READ_TASK: {

      auto *rt = reinterpret_cast<read_task *>(task_t);
      if (rt->source.worker == -1) {
        solver_task_map.emplace(actual_index, solver_index);
        input.task_size[solver_index] = rt->destination.size;
        solver_index++;
      } else {
        static_task_map.emplace(actual_index, rt->source.worker);
        static_index++;
      }
      break;
    }
    default:
      std::cout << "schedule_tasks(): Error in task type\n";
      break;
    }
    actual_index++;
  }

  auto map = labios_system::getInstance(service_i)->map_server();
  auto sorted_workers = std::vector<std::pair<int, int>>();

  // sort workers on capacity
  int original_index = 0;
  for (int worker_index = 0; worker_index < MAX_WORKER_COUNT; worker_index++) {
    std::string val = map->get(table::WORKER_CAPACITY, std::to_string(worker_index + 1), std::to_string(-1));
    sorted_workers.emplace_back(std::make_pair(atoi(val.c_str()), original_index++));
  }
  std::sort(sorted_workers.begin(), sorted_workers.end());

  // put capacity/score/energy on three different arrys
  int new_index = 0;
  for (auto pair : sorted_workers) {
    std::string val = map->get(table::WORKER_SCORE, std::to_string(pair.second + 1), std::to_string(-1));

    worker_score[new_index] = atoi(val.c_str());
    worker_capacity[new_index] = pair.first;
    worker_energy[new_index] = WORKER_ENERGY;
    std::cout << "worker:" << pair.second + 1
              << " capacity:" << worker_capacity[new_index]
              << " score:" << worker_score[new_index] << std::endl;
    new_index++;
  }

  // create solver output
  solver_output solver_output_i(input.num_tasks);
  // loop max workers
  for (auto i = 1; i <= MAX_WORKER_COUNT; i++) {
      // create temp solution
      solver_output solver_output_temp(input.num_tasks);
      // loop the current max workers
      for (auto index = 0; index < i; index++) {
          // look a capacity of worker
          int capacity = worker_capacity[index];
          // Iterate over tasks
          for (auto task_index = 0; task_index < input.num_tasks; task_index++) {
              // get size of task
              auto task_size = input.task_size[task_index];
              
              // schedule if it fits
              if (task_size > capacity) {
                  break;
              } else {
                  capacity -= task_size;
                  solver_output_temp.solution[task_index] = i;
              }
          }
      }
      // check if all tasks are scheduled
      bool all_tasks_scheduled = true;
      for (auto t = 0; t < input.num_tasks; t++) {
        if (solver_output_temp.solution[t] == 0) {
          all_tasks_scheduled = false;
          break;
        }
      }
      if (all_tasks_scheduled) {
        // persist solution if all tasks ar scheduled
        for (auto t = 0; t < input.num_tasks; t++) {
          solver_output_i.solution[t] = solver_output_temp.solution[t];
        }
        delete (p);
        // exit the planification
        break;
      }
      delete (p);
    }

  // check if there is a solution
  for (int t = 0; t < input.num_tasks; t++) {
    if (solver_output_i.solution[t] - 1 < 0 ||
        solver_output_i.solution[t] - 1 > MAX_WORKER_COUNT) {
      throw std::runtime_error("DPSolver::solve(): No Solution found\n");
    }
    solver_output_i.solution[t] = sorted_workers[solver_output_i.solution[t] - 1].second + 1;
    std::cout << "task:" << (t) << " worker:" << solver_output_i.solution[t]<< std::endl;
  }

  //    std::cout<<"Final Solution"<<std::endl;
  //    for(int i=0;i<input.num_tasks;i++){
  //        std::cout<<"task:"<<(i+1)<<"
  //        worker:"<<solver_output_i.solution[i]<<std::endl;
  //    }

  /**
   * merge all tasks (static or solver) in order based on what solver gave us
   * or static info we already had
   */
  for (int task_index = 0; task_index < input.num_tasks; ++task_index) {
    auto static_map_iter = static_task_map.find(task_index);
    int worker_index = -1;
    if (static_map_iter == static_task_map.end()) {
      auto solver_map_iter = solver_task_map.find(task_index);
      if (solver_map_iter == solver_task_map.end()) {
        printf("Error");
      } else {
        solver_index = solver_map_iter->second;
        worker_index = solver_output_i.solution[solver_index];
      }
    } else {
      worker_index = static_map_iter->second;
    }

    auto it = solver_output_i.worker_task_map.find(worker_index);
    std::vector<task *> worker_tasks;
    if (it == solver_output_i.worker_task_map.end()) {
      worker_tasks = std::vector<task *>();
      worker_tasks.push_back(input.tasks[task_index]);
      solver_output_i.worker_task_map.emplace(
          std::make_pair(worker_index, worker_tasks));
    } else
      it->second.push_back(input.tasks[task_index]);
  }
  delete (worker_score);
  delete (worker_capacity);
  delete (worker_energy);

  return solver_output_i;
}
