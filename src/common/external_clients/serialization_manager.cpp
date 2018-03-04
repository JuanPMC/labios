//
// Created by hariharan on 2/23/18.
//

#include "serialization_manager.h"

std::string serialization_manager::serialise_file_stat(file_stat stat) {
    std::stringstream ss; // any stream can be used

    {
        cereal::BinaryOutputArchive oarchive(ss); // Create an output archive
        oarchive(stat); // Write the data to the archive
    }
    return ss.str();
}

chunk_meta serialization_manager::deserialise_chunk(std::string chunk_str) {
    chunk_meta cm;
    {
        std::stringstream ss(chunk_str);
        cereal::BinaryInputArchive iarchive(ss); // Create an input archive
        iarchive(cm);
    }
    return cm;
}

std::string serialization_manager::serialise_chunk(chunk_meta meta) {
    std::stringstream ss; // any stream can be used

    {
        cereal::BinaryOutputArchive oarchive(ss); // Create an output archive
        oarchive(meta); // Write the data to the archive
    }
    return ss.str();
}

std::string serialization_manager::serialise_task(task* task) {
    switch (task->t_type){
        case task_type ::WRITE_TASK:{
            write_task *wt= static_cast<write_task *>(task);
            std::stringstream ss; // any stream can be used

            {
                cereal::BinaryOutputArchive oarchive(ss); // Create an output archive
                oarchive(*wt); // Write the data to the archive
            }
            return ss.str();
        }
        case task_type ::READ_TASK:{
            read_task *rt= static_cast<read_task *>(task);
            std::stringstream ss; // any stream can be used

            {
                cereal::BinaryOutputArchive oarchive(ss); // Create an output archive
                oarchive(*rt); // Write the data to the archive
            }
            return ss.str();
        }
    }
    return std::__cxx11::string();
}


task serialization_manager::deserialise_task(const char *string) {
    task cm(task_type::WRITE_TASK);
    {
        std::stringstream ss(string);
        cereal::BinaryInputArchive iarchive(ss); // Create an input archive
        iarchive(cm);
        switch (cm.t_type){
            case task_type ::WRITE_TASK:{
                write_task *wt= static_cast<write_task *>(&cm);
                return *wt;
            }
            case task_type ::READ_TASK:{
                read_task *rt= static_cast<read_task *>(&cm);
                return *rt;
            }
        }
    }
    return cm;
}
