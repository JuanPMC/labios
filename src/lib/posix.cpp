//
// Created by hariharan on 2/16/18.
//
#include <zconf.h>
#include "posix.h"
#include "../common/task_builder/task_builder.h"

FILE *porus::fopen(const char *filename, const char *mode) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    FILE* fh;
    if(!mdm->is_created(filename)){
        if(strcmp(mode,"r")==0 || strcmp(mode,"weight")==0 || strcmp(mode,"consider_after_a")==0){
            return nullptr;
        }else{
            mdm->create(filename,mode,fh);
        }
    }else{
        if(mdm->is_opened(filename))
            mdm->update_on_open(filename,mode,fh);
        else return nullptr;
    }
    return fh;
}

int porus::fclose(FILE *stream) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    if(!mdm->is_opened(stream)) return -1;
    return mdm->update_on_close(stream);
}

int porus::fseek(FILE *stream, long int offset, int origin) {

    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    auto filename=mdm->get_filename(stream);
    if( mdm->get_mode(filename)=="consider_after_a" ||
            mdm->get_mode(filename)=="consider_after_a+") return 0;
    auto size=mdm->get_filesize(filename);
    auto fp=mdm->get_fp(filename);
    switch(origin){
        case SEEK_SET:
            if(offset > size) return -1;
            break;
        case SEEK_CUR:
            if(fp + offset > size || fp + offset < 0) return -1;
            break;
        case SEEK_END:
            if(offset > 0) return -1;
            break;
        default:
            fprintf(stderr, "Seek origin fault!\n");
            return -1;
    }
    if(!mdm->is_opened(stream)) return -1;
    return mdm->update_on_seek(filename, offset, origin);
}

size_t porus::fread(void *ptr, size_t size, size_t count, FILE *stream) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    auto client_queue=aetrio_system::getInstance(LIB)->get_queue_client(CLIENT_TASK_SUBJECT);
    std::shared_ptr<task_builder> task_m=task_builder::getInstance(LIB);
    std::shared_ptr<data_manager> data_m=data_manager::getInstance(LIB);
    auto filename=mdm->get_filename(stream);
    auto offset=mdm->get_fp(filename);
    if(!mdm->is_opened(filename)) return 0;
    std::vector<read_task> read_tasks=task_m->build_task_read(read_task(file(filename,offset,size*count),file()));
    int ptr_pos=0;

    for(auto task:read_tasks){
        char * data;
        switch(task.source.dest_t){
            case FILE_LOC:{
                client_queue->publish_task(&task);
                while(!data_m->exists(task.destination.filename)) usleep(20);
                data = const_cast<char *>(data_m->get(task.destination.filename).c_str());
                data_m->remove(DATASPACE_DB,task.destination.filename);
                break;
            }
            case DATASPACE_LOC:{
                data = const_cast<char *>(data_m->get(task.source.filename).c_str());
                break;
            }

        }

        memcpy(ptr+ptr_pos,data+task.source.offset,task.source.size);
    }
    mdm->update_read_task_info(read_tasks,filename);
    return size*count;
}

size_t porus::fwrite(void *ptr, size_t size, size_t count, FILE *stream) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    auto client_queue=aetrio_system::getInstance(LIB)->get_queue_client(CLIENT_TASK_SUBJECT);
    std::shared_ptr<task_builder> task_m=task_builder::getInstance(LIB);
    std::shared_ptr<data_manager> data_m=data_manager::getInstance(LIB);
    auto filename=mdm->get_filename(stream);
    auto offset=mdm->get_fp(filename);
    if(!mdm->is_opened(filename)) return 0;
    auto tsk=write_task(file(filename,offset,size*count),file());
    std::vector<write_task> write_tasks=task_m->build_task_write(tsk,static_cast<char *>(ptr));
    std::string id;
    int index=0;
    std::string data((char*)ptr);
    for(auto task:write_tasks){
        id=task.destination.filename;
        std::string temp_data=data.substr(task.source.offset,task.destination.size);
        data_m->put(id, temp_data);
        client_queue->publish_task(&task);
        index++;
    }
    mdm->update_write_task_info(write_tasks,filename);
    return size*count;
}


