# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/hdevarajan/software/clion/bin/cmake/bin/cmake

# The command to remove a file.
RM = /home/hdevarajan/software/clion/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hdevarajan/clion/porus

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hdevarajan/clion/porus/bin

# Include any dependencies generated for this target.
include CMakeFiles/porus_worker.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/porus_worker.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/porus_worker.dir/flags.make

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o: ../src/common/data_manager/data_manager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o -c /home/hdevarajan/clion/porus/src/common/data_manager/data_manager.cpp

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/data_manager/data_manager.cpp > CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.i

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/data_manager/data_manager.cpp -o CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.s

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o


CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o: ../src/common/external_clients/DistributedHashMap.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o -c /home/hdevarajan/clion/porus/src/common/external_clients/DistributedHashMap.cpp

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/external_clients/DistributedHashMap.cpp > CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.i

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/external_clients/DistributedHashMap.cpp -o CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.s

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o


CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o: ../src/common/metadata_manager/metadata_manager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o -c /home/hdevarajan/clion/porus/src/common/metadata_manager/metadata_manager.cpp

CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/metadata_manager/metadata_manager.cpp > CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.i

CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/metadata_manager/metadata_manager.cpp -o CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.s

CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o


CMakeFiles/porus_worker.dir/src/System.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/System.cpp.o: ../src/System.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/porus_worker.dir/src/System.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/System.cpp.o -c /home/hdevarajan/clion/porus/src/System.cpp

CMakeFiles/porus_worker.dir/src/System.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/System.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/System.cpp > CMakeFiles/porus_worker.dir/src/System.cpp.i

CMakeFiles/porus_worker.dir/src/System.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/System.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/System.cpp -o CMakeFiles/porus_worker.dir/src/System.cpp.s

CMakeFiles/porus_worker.dir/src/System.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/System.cpp.o.requires

CMakeFiles/porus_worker.dir/src/System.cpp.o.provides: CMakeFiles/porus_worker.dir/src/System.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/System.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/System.cpp.o.provides

CMakeFiles/porus_worker.dir/src/System.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/System.cpp.o


CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o: ../src/common/task_handler/task_handler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o -c /home/hdevarajan/clion/porus/src/common/task_handler/task_handler.cpp

CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/task_handler/task_handler.cpp > CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.i

CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/task_handler/task_handler.cpp -o CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.s

CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o


CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o: ../src/common/external_clients/DistributedQueue.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o -c /home/hdevarajan/clion/porus/src/common/external_clients/DistributedQueue.cpp

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/external_clients/DistributedQueue.cpp > CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.i

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/external_clients/DistributedQueue.cpp -o CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.s

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o


CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o: ../src/common/external_clients/serialization_manager.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o -c /home/hdevarajan/clion/porus/src/common/external_clients/serialization_manager.cpp

CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/external_clients/serialization_manager.cpp > CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.i

CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/external_clients/serialization_manager.cpp -o CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.s

CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o


CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o: ../src/common/external_clients/RocksDBImpl.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o -c /home/hdevarajan/clion/porus/src/common/external_clients/RocksDBImpl.cpp

CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/external_clients/RocksDBImpl.cpp > CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.i

CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/external_clients/RocksDBImpl.cpp -o CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.s

CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o


CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o: ../src/common/external_clients/MemcacheDImpl.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o -c /home/hdevarajan/clion/porus/src/common/external_clients/MemcacheDImpl.cpp

CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/common/external_clients/MemcacheDImpl.cpp > CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.i

CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/common/external_clients/MemcacheDImpl.cpp -o CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.s

CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.requires

CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.provides: CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.provides

CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o


CMakeFiles/porus_worker.dir/src/worker/main.cpp.o: CMakeFiles/porus_worker.dir/flags.make
CMakeFiles/porus_worker.dir/src/worker/main.cpp.o: ../src/worker/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/porus_worker.dir/src/worker/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/porus_worker.dir/src/worker/main.cpp.o -c /home/hdevarajan/clion/porus/src/worker/main.cpp

CMakeFiles/porus_worker.dir/src/worker/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/porus_worker.dir/src/worker/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hdevarajan/clion/porus/src/worker/main.cpp > CMakeFiles/porus_worker.dir/src/worker/main.cpp.i

CMakeFiles/porus_worker.dir/src/worker/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/porus_worker.dir/src/worker/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hdevarajan/clion/porus/src/worker/main.cpp -o CMakeFiles/porus_worker.dir/src/worker/main.cpp.s

CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.requires:

.PHONY : CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.requires

CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.provides: CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/porus_worker.dir/build.make CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.provides.build
.PHONY : CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.provides

CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.provides.build: CMakeFiles/porus_worker.dir/src/worker/main.cpp.o


# Object files for target porus_worker
porus_worker_OBJECTS = \
"CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o" \
"CMakeFiles/porus_worker.dir/src/System.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o" \
"CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o" \
"CMakeFiles/porus_worker.dir/src/worker/main.cpp.o"

# External object files for target porus_worker
porus_worker_EXTERNAL_OBJECTS =

porus_worker: CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/System.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/src/worker/main.cpp.o
porus_worker: CMakeFiles/porus_worker.dir/build.make
porus_worker: /usr/local/lib/libmpicxx.so
porus_worker: /usr/local/lib/libmpi.so
porus_worker: CMakeFiles/porus_worker.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hdevarajan/clion/porus/bin/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable porus_worker"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/porus_worker.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/porus_worker.dir/build: porus_worker

.PHONY : CMakeFiles/porus_worker.dir/build

CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/data_manager/data_manager.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedHashMap.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/metadata_manager/metadata_manager.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/System.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/task_handler/task_handler.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/external_clients/DistributedQueue.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/external_clients/serialization_manager.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/external_clients/RocksDBImpl.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/common/external_clients/MemcacheDImpl.cpp.o.requires
CMakeFiles/porus_worker.dir/requires: CMakeFiles/porus_worker.dir/src/worker/main.cpp.o.requires

.PHONY : CMakeFiles/porus_worker.dir/requires

CMakeFiles/porus_worker.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/porus_worker.dir/cmake_clean.cmake
.PHONY : CMakeFiles/porus_worker.dir/clean

CMakeFiles/porus_worker.dir/depend:
	cd /home/hdevarajan/clion/porus/bin && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hdevarajan/clion/porus /home/hdevarajan/clion/porus /home/hdevarajan/clion/porus/bin /home/hdevarajan/clion/porus/bin /home/hdevarajan/clion/porus/bin/CMakeFiles/porus_worker.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/porus_worker.dir/depend

