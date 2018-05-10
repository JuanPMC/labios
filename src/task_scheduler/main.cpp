


#include "../common/data_structures.h"
#include "../common/solver/dp_solver.h"

int main() {
    int tasks = 10;

    int p_arr[10] = {1,1,1,1,1,1,1,1,1,1};
    int x[4];
    int workers = 4;
    int worker_busyness[4] = {25, 40, 15, 100};
    int worker_capacity[4] = {2, 5, 5, 5};
    solver_input input(tasks,workers);
    for(auto i=0;i<tasks;i++){
        input.task_size[i]=64+i*100/5;
    }
    for(auto i=0;i<workers;i++){
        input.worker_score[i]=(i+1);
    }
    for(auto i=0;i<workers;i++){
        input.worker_capacity[i]=64+i*1000/5;
    }
    input.num_task = tasks;
    DPSolver solver=DPSolver(TASK_SCHEDULER);
    solver_output output=solver.solve(input);
    std::cout<<output.max_value<< std::endl;
    for(int i=0;i<tasks;i++){
        std::cout<<*(output.solution+i)<< std::endl;;
    }
    return 0;
}