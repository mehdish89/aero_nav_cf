# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/yifang/catkin_ws_test/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yifang/catkin_ws_test/build

# Include any dependencies generated for this target.
include crazyflie_tools/CMakeFiles/scan.dir/depend.make

# Include the progress variables for this target.
include crazyflie_tools/CMakeFiles/scan.dir/progress.make

# Include the compile flags for this target's objects.
include crazyflie_tools/CMakeFiles/scan.dir/flags.make

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o: crazyflie_tools/CMakeFiles/scan.dir/flags.make
crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o: /home/yifang/catkin_ws_test/src/crazyflie_tools/src/scan.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/yifang/catkin_ws_test/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o"
	cd /home/yifang/catkin_ws_test/build/crazyflie_tools && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/scan.dir/src/scan.cpp.o -c /home/yifang/catkin_ws_test/src/crazyflie_tools/src/scan.cpp

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/scan.dir/src/scan.cpp.i"
	cd /home/yifang/catkin_ws_test/build/crazyflie_tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/yifang/catkin_ws_test/src/crazyflie_tools/src/scan.cpp > CMakeFiles/scan.dir/src/scan.cpp.i

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/scan.dir/src/scan.cpp.s"
	cd /home/yifang/catkin_ws_test/build/crazyflie_tools && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/yifang/catkin_ws_test/src/crazyflie_tools/src/scan.cpp -o CMakeFiles/scan.dir/src/scan.cpp.s

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.requires:
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.requires

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.provides: crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.requires
	$(MAKE) -f crazyflie_tools/CMakeFiles/scan.dir/build.make crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.provides.build
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.provides

crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.provides.build: crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o

# Object files for target scan
scan_OBJECTS = \
"CMakeFiles/scan.dir/src/scan.cpp.o"

# External object files for target scan
scan_EXTERNAL_OBJECTS =

/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o
/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: crazyflie_tools/CMakeFiles/scan.dir/build.make
/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: /home/yifang/catkin_ws_test/devel/lib/libcrazyflie_cpp.so
/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: /usr/lib/x86_64-linux-gnu/libusb-1.0.so
/home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan: crazyflie_tools/CMakeFiles/scan.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan"
	cd /home/yifang/catkin_ws_test/build/crazyflie_tools && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/scan.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
crazyflie_tools/CMakeFiles/scan.dir/build: /home/yifang/catkin_ws_test/devel/lib/crazyflie_tools/scan
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/build

crazyflie_tools/CMakeFiles/scan.dir/requires: crazyflie_tools/CMakeFiles/scan.dir/src/scan.cpp.o.requires
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/requires

crazyflie_tools/CMakeFiles/scan.dir/clean:
	cd /home/yifang/catkin_ws_test/build/crazyflie_tools && $(CMAKE_COMMAND) -P CMakeFiles/scan.dir/cmake_clean.cmake
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/clean

crazyflie_tools/CMakeFiles/scan.dir/depend:
	cd /home/yifang/catkin_ws_test/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yifang/catkin_ws_test/src /home/yifang/catkin_ws_test/src/crazyflie_tools /home/yifang/catkin_ws_test/build /home/yifang/catkin_ws_test/build/crazyflie_tools /home/yifang/catkin_ws_test/build/crazyflie_tools/CMakeFiles/scan.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : crazyflie_tools/CMakeFiles/scan.dir/depend

