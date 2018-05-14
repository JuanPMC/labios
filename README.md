# README #

##TODO CODE
* IDs everywhere
* Debugged with many cases for logical bugs
* Metadata updates and creation
* task_builder alogorithm for building read and write task
    * case 1: new write:
        * if write > 64KB && <2MB then build 1 task
        * if write > 2MB then chunk into 2 MB tasks
        * if write < 64KB put into small I/O
    * case 2: update written data:
        * if prev write is still in client queue/written into disk
            * create a update tasks (based on existing chunks)
    * case 3: read_task:
        * if data in data pool just read and return
        * if data in disk and make read request specifically from that worker.
* Task scheduling with greedy
    * approach 1: make current dp greedy
    * approach 2: make customized greedy
* Worker Manager Service
    * Perform automated task balancing of worker.
    * Build a sorted list of worker scores
    * Wake and sleep workers (based on events using nats(WORKER_MANAGER tasks))
* System Manager Service
    * Setup Application registrations
* code cleanup
##TODO INVESTIGATION
* Investigate worker suspension
* Investigate read simulation
* Automated server bootstrapping
* Cluster environment: 1 Lib, 1 TaskSched, 2 worker


##Setup Porus
### Memcached
#### Client
`memcached -p 11211 -l localhost -d  -I 4M`
#### Server
`memcached -p 11212 -l localhost -d  -I 4M`
### NATS
#### Client
`gnatsd -p 4222 -a localhost -DV -m 8222 -l ~/nats_client.log &`
#### Server
`gnatsd -p 4223 -a localhost -l -DV -m 8223 -l ~/nats_server.log &`




