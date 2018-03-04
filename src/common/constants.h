//
// Created by hariharan on 2/16/18.
//

#ifndef PORUS_MAIN_CONSTANTS_H
#define PORUS_MAIN_CONSTANTS_H

#include <cstddef>
#include <climits>
#include <string>

const std::string PORUS_CLIENT_PORT="9999";
const size_t KEY_SIZE=256;
const size_t FILE_SIZE=256;
const long long MAX_DATA_SIZE=2*1024*1024*1024;
const size_t CHUNK_SIZE=2*1024*1024;
const long long MAX_MESSAGE_SIZE=LLONG_MAX;
const std::string ALL_KEYS="ALL";
const std::string kDBPath_client = "/tmp/rocksdb";
const std::string kDBPath_server = "/tmp/rocksdb";
const std::string NATS_URL="nats://ivan:secret@localhost:4222/";
const std::string MEMCACHED_URL_CLIENT="--SERVER=localhost:8192";
const std::string MEMCACHED_URL_SERVER="--SERVER=localhost:8192";
const map_impl_type map_impl_type_t=map_impl_type::MEMCACHE_D;
const size_t io_unit_max=2*1024*1024;
const std::string TASK_SUBJECT="TASK";
const std::string KEY_SEPARATOR="#";
#endif //PORUS_MAIN_CONSTANTS_H