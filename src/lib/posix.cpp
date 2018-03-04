//
// Created by hariharan on 2/16/18.
//
#include "../../include/posix.h"

FILE *porus::fopen(const char *filename, const char *mode) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    FILE* fh;
    if(!mdm->is_created(filename)){
        if(strcmp(mode,"r")==0 || strcmp(mode,"w")==0 || strcmp(mode,"a")==0){
            return nullptr;
        }else{
            mdm->create(filename,mode,fh);
        }
    }else{
        if(!mdm->is_opened(filename))
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
    if( mdm->get_mode(filename)=="a" ||
            mdm->get_mode(filename)=="a+") return 0;
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
    std::shared_ptr<task_handler> task_m=task_handler::getInstance(LIB);
    std::shared_ptr<data_manager> data_m=data_manager::getInstance(LIB);
    auto filename=mdm->get_filename(stream);
    auto offset=mdm->get_fp(filename);
    if(!mdm->is_opened(filename)) return 0;
    std::vector<read_task> read_tasks=task_m->build_task_read(read_task(file(filename,offset,size*count),file(),source_type::FILE_LOC,""));
    int ptr_pos=0;

    for(auto task:read_tasks){
        task_m->submit(&task);
        void * data=data_m->get(task.datasource_id);
        memcpy(ptr+ptr_pos,data+task.source.offset,task.source.size);
    }
    mdm->update_read_task_info(read_tasks,filename);
    return size*count;
}

size_t porus::fwrite(void *ptr, size_t size, size_t count, FILE *stream) {
    std::shared_ptr<metadata_manager> mdm=metadata_manager::getInstance(LIB);
    std::shared_ptr<task_handler> task_m=task_handler::getInstance(LIB);
    std::shared_ptr<data_manager> data_m=data_manager::getInstance(LIB);
    auto filename=mdm->get_filename(stream);
    auto offset=mdm->get_fp(filename);
    if(!mdm->is_opened(filename)) return 0;
    auto tsk=write_task(file(filename,offset,size*count),file(),source_type::DATASPACE_LOC,"");
    tsk.data= static_cast<char *>(ptr);
    std::vector<write_task> write_tasks=task_m->build_task_write(tsk);
    std::string id;
    for(auto task:write_tasks){
        task_m->submit(&task);
        id=task.datasource_id;
    }
    mdm->update_write_task_info(write_tasks,filename);
    data_m->put(id, const_cast<void *>(ptr));
    return size*count;
}

int porus::MPI_Init(int *argc, char ***argv) {
    PMPI_Init(argc,argv);
    System::getInstance(Service::LIB);
    return 0;
}

void porus::MPI_Finalize() {
    PMPI_Finalize();
}