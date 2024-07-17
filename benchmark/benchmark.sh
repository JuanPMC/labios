#!/bin/bash

# Number of times to repeat the process
repeat_count=50

# Number of parallel executions each time
parallel_count=50

# Loop to repeat the process
for (( i=1; i<=$repeat_count; i++ )); do
    echo "Starting iteration $i..."

    # Record the start time
    start_time=$(date +%s%N)

    # Loop to run the command in parallel
    for (( j=1; j<=$parallel_count; j++ )); do
        ./labios_simple_write ../conf/default.yaml &
    done

    # Wait for all background processes to finish
    wait

    # Record the end time
    end_time=$(date +%s%N)

    # Calculate and display the elapsed time in milliseconds
    elapsed_time=$(( (end_time - start_time) / 1000000 ))
    echo "Iteration $i complete, in: ${elapsed_time} milliseconds."
done

echo "All iterations complete."