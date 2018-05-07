//
// Created by hariharan on 2/17/18.
//

#ifndef PORUS_MAIN_STRUCTURE_H
#define PORUS_MAIN_STRUCTURE_H



#include <cereal/types/memory.hpp>
#include "enumerations.h"
#include "constants.h"
#include <cereal/types/string.hpp>

struct message_key{
    message_type m_type;
    map_type mp_type;
    operation operation_type;
    char key[KEY_SIZE];

};
struct message{
    message_type m_type;
    map_type mp_type;
    char key[KEY_SIZE];
    size_t data_size;
    char* data;
};
struct file{
    source_type dest_t;
    std::string filename;
    size_t offset;
    size_t size;
    file(std::string filename,
    size_t offset,
    size_t file_size):filename(filename),offset(offset),size(file_size),dest_t(DATASPACE_LOC){}
    file(const file &file_t):filename(file_t.filename),offset(file_t.offset),size(file_t.size),dest_t(file_t.dest_t){}

    file(){};
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( this->filename,this->offset,this->size,this->dest_t);
    }
};
struct chunk_meta{
    file actual_user_chunk;
    file destination;
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( this->actual_user_chunk,this->destination );
    }

};
struct chunk_msg{
    source_type chunkType;
    std::string dataspace_id;
    std::string filename;
    size_t offset;
    size_t file_size;

};
struct file_meta{
    file file_struct;
    std::vector<chunk_meta> chunks;
    file_meta():chunks(){}
};
struct dataspace{
    size_t size;
    void* data;
};

struct file_stat{
    FILE* fh;
    size_t file_pointer;
    size_t file_size;
    std::string mode;
    bool is_open;
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( /*this->fh,*/ this->file_pointer, this->file_size,this->mode,this->is_open );
    }
};

struct task {
    task_type t_type;
    task(task_type t_type):t_type(t_type){}
    task(const task &t_other):t_type(t_other.t_type){}
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( this->t_type );
    }
};
struct write_task:public task{
    write_task():task(WRITE_TASK){}
    write_task(file source,
               file destination,
               source_type dest_t,
               std::string datasource_id):task(WRITE_TASK),source(source),destination(destination){}
    write_task(const write_task &write_task_t):task(WRITE_TASK),
                                        source(write_task_t.source),
                                        destination(write_task_t.destination){}
    file source;
    bool meta_updated;
    std::string data;
    file destination;

    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( cereal::base_class<task>( this ),this->source,this->destination);
    }
};
struct read_task:public task{
    read_task():task(READ_TASK){}
    read_task(const read_task &read_task_t):task(READ_TASK),
                                        source(read_task_t.source),
                                        destination(read_task_t.destination){}
    read_task(file source,
              file destination,
              source_type dest_t,
              std::string datasource_id):task(WRITE_TASK),source(source),destination(destination){}

    std::string data;
    bool meta_updated;
    file source;
    file destination;
    template<class Archive>
    void serialize(Archive & archive)
    {
        archive( cereal::base_class<task>( this ),this->source,this->destination);
    }
};



#endif //PORUS_MAIN_STRUCTURE_H