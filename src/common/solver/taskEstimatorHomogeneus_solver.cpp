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
#include <labios/common/solver/taskEstimatorHomogeneus_solver.h>
#include <labios/labios_system.h>

std::shared_ptr<taskEstimatorHomogeneus_solver> taskEstimatorHomogeneus_solver::instance = nullptr;
/******************************************************************************
 *Interface
 ******************************************************************************/
solver_output taskEstimatorHomogeneus_solver::solve(solver_input input) {
  std::vector<task *> worker_tasks;
  auto map_server = labios_system::getInstance(service_i)->map_server();
  solver_output solution(input.num_tasks);

  // get sorted workers
  int64_t *worker_capacity = new int64_t[MAX_WORKER_COUNT];
  auto workers = std::vector<std::pair<int, int>>();
  int original_index = 0;
  // loop workers and set initial capacity value to 0
  for (int worker_index = 0; worker_index < MAX_WORKER_COUNT; worker_index++) {
      workers.emplace_back(std::make_pair(0, original_index++));
  }
  // get the worker scores
  int *worker_score = new int[MAX_WORKER_COUNT];
  int new_index = 0;
  for (auto pair : workers) {
    std::string val = map_server->get(table::WORKER_SCORE, std::to_string(pair.second + 1), std::to_string(-1));
    worker_score[new_index] = atoi(val.c_str());
    new_index++;
  }

  // loop tasks
  for (auto i = 0; i < input.tasks.size(); i++) {
    // sort the workers
    std::sort(workers.begin(), workers.end());

    // select a worker
    worker_id = workers[0].second
    // calculate the effect of the scheduled task
    workers[0].first += (1/(float)worker_score[worker_id]) * input.task_size[i];

    // Schedule the task to the selected worker or the prediefined worker
    switch (input.tasks[i]->t_type) {
    case task_type::WRITE_TASK: {
      auto *wt = reinterpret_cast<write_task *>(input.tasks[i]);
      if (wt->destination.worker == -1)
        solution.solution[i] = static_cast<int>(worker_id + 1);
      else
        solution.solution[i] = wt->destination.worker;
      break;
    }
    case task_type::READ_TASK: {
      auto *rt = reinterpret_cast<read_task *>(input.tasks[i]);
      if (rt->source.worker == -1)
        solution.solution[i] = static_cast<int>(worker_id + 1);
      else
        solution.solution[i] = rt->source.worker;
      break;
    }
    case task_type::DELETE_TASK: {
      auto *dt = reinterpret_cast<delete_task *>(input.tasks[i]);
      if (dt->source.worker == -1)
        std::cerr << "taskEstimatorHomogeneus_solver::solve():\t "
                     "delete task failed\n";
      else
        solution.solution[i] = dt->source.worker;
      break;
    }
    case task_type::FLUSH_TASK: {
      auto *ft = reinterpret_cast<flush_task *>(input.tasks[i]);
      if (ft->source.worker == -1)
        std::cerr << "taskEstimatorHomogeneus_solver::solve():\t "
                     "flush task failed\n";
      else
        solution.solution[i] = ft->source.worker;
      break;
    }
    default:
      std::cerr << "taskEstimatorHomogeneus_solver::solve()\t "
                   "task type invalid\n";
    }

// Asign worker to tasks
#ifdef DEBUG
    std::cout << "Task#" << i << " Worker#" << solution.solution[i] << "\n";
#endif
    auto it = solution.worker_task_map.find(solution.solution[i]);
    if (it == solution.worker_task_map.end()) {
      worker_tasks = std::vector<task *>();
      worker_tasks.push_back(input.tasks[i]);
      solution.worker_task_map.emplace(
          std::make_pair(solution.solution[i], worker_tasks));
    } else
      it->second.push_back(input.tasks[i]);
  }
  // return the soluton
  return solution;
}
