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
#include <labios/common/solver/mTATmax_solver.h>
#include <labios/labios_system.h>

std::shared_ptr<mTATmax_solver> mTATmax_solver::instance = nullptr;
/******************************************************************************
 * For calculating mTAT
 ******************************************************************************/
double mTATmax_solver::mTAT(double mean_duration, double mean_speed, int n_tasks) {
    return (mean_duration / mean_speed) * (n_tasks * (n_tasks + 1) / 2.0);
}
/******************************************************************************
 *Interface
 ******************************************************************************/
solver_output mTATmax_solver::solve(solver_input input) {
  std::vector<task *> worker_tasks;
  auto map_server = labios_system::getInstance(service_i)->map_server();
  solver_output solution(input.num_tasks);

  // get sorted workers
  int64_t *worker_capacity = new int64_t[MAX_WORKER_COUNT];
  auto workers_socres = std::vector<std::pair<int, int>>();
  int original_index = 0;
  // loop workers to populate scores the simulated mTAT table
  for (int worker_index = 0; worker_index < MAX_WORKER_COUNT; worker_index++) {
      std::string w_score = map_server->get(table::WORKER_SCORE, std::to_string(original_index + 1), std::to_string(-1));
      for (auto i = 0; i < input.tasks.size(); i++) {
        workers_socres.emplace_back(std::make_pair(this->mTAT(1,atof(w_score.c_str()),i+1), original_index));
      }
      original_index++; 
  }    
  // sort them form lowest to highest
  std::sort(workers_socres.begin(), workers_socres.end(), [](auto a, auto b) {return a.first < b.first;});

  // loop tasks
  for (auto i = 0; i < input.tasks.size(); i++) {
    // select a worker
    worker_id = workers_socres[i].second

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
        std::cerr << "mTATmax_solver::solve():\t "
                     "delete task failed\n";
      else
        solution.solution[i] = dt->source.worker;
      break;
    }
    case task_type::FLUSH_TASK: {
      auto *ft = reinterpret_cast<flush_task *>(input.tasks[i]);
      if (ft->source.worker == -1)
        std::cerr << "mTATmax_solver::solve():\t "
                     "flush task failed\n";
      else
        solution.solution[i] = ft->source.worker;
      break;
    }
    default:
      std::cerr << "mTATmax_solver::solve()\t "
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
