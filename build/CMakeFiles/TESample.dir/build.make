# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/camh/Documents/Retro68kApps/TESample

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/camh/Documents/Retro68kApps/TESample/build

# Include any dependencies generated for this target.
include CMakeFiles/TESample.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/TESample.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TESample.dir/flags.make

CMakeFiles/TESample.dir/SerialHelper.c.obj: CMakeFiles/TESample.dir/flags.make
CMakeFiles/TESample.dir/SerialHelper.c.obj: ../SerialHelper.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/TESample.dir/SerialHelper.c.obj"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/TESample.dir/SerialHelper.c.obj   -c /home/camh/Documents/Retro68kApps/TESample/SerialHelper.c

CMakeFiles/TESample.dir/SerialHelper.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TESample.dir/SerialHelper.c.i"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/camh/Documents/Retro68kApps/TESample/SerialHelper.c > CMakeFiles/TESample.dir/SerialHelper.c.i

CMakeFiles/TESample.dir/SerialHelper.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TESample.dir/SerialHelper.c.s"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/camh/Documents/Retro68kApps/TESample/SerialHelper.c -o CMakeFiles/TESample.dir/SerialHelper.c.s

CMakeFiles/TESample.dir/coprocessorjs.c.obj: CMakeFiles/TESample.dir/flags.make
CMakeFiles/TESample.dir/coprocessorjs.c.obj: ../coprocessorjs.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/TESample.dir/coprocessorjs.c.obj"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/TESample.dir/coprocessorjs.c.obj   -c /home/camh/Documents/Retro68kApps/TESample/coprocessorjs.c

CMakeFiles/TESample.dir/coprocessorjs.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TESample.dir/coprocessorjs.c.i"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/camh/Documents/Retro68kApps/TESample/coprocessorjs.c > CMakeFiles/TESample.dir/coprocessorjs.c.i

CMakeFiles/TESample.dir/coprocessorjs.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TESample.dir/coprocessorjs.c.s"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/camh/Documents/Retro68kApps/TESample/coprocessorjs.c -o CMakeFiles/TESample.dir/coprocessorjs.c.s

CMakeFiles/TESample.dir/TESample.c.obj: CMakeFiles/TESample.dir/flags.make
CMakeFiles/TESample.dir/TESample.c.obj: ../TESample.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/TESample.dir/TESample.c.obj"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/TESample.dir/TESample.c.obj   -c /home/camh/Documents/Retro68kApps/TESample/TESample.c

CMakeFiles/TESample.dir/TESample.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/TESample.dir/TESample.c.i"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/camh/Documents/Retro68kApps/TESample/TESample.c > CMakeFiles/TESample.dir/TESample.c.i

CMakeFiles/TESample.dir/TESample.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/TESample.dir/TESample.c.s"
	/home/camh/Retro68-build/toolchain/bin/m68k-apple-macos-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/camh/Documents/Retro68kApps/TESample/TESample.c -o CMakeFiles/TESample.dir/TESample.c.s

# Object files for target TESample
TESample_OBJECTS = \
"CMakeFiles/TESample.dir/SerialHelper.c.obj" \
"CMakeFiles/TESample.dir/coprocessorjs.c.obj" \
"CMakeFiles/TESample.dir/TESample.c.obj"

# External object files for target TESample
TESample_EXTERNAL_OBJECTS =

TESample.code.bin: CMakeFiles/TESample.dir/SerialHelper.c.obj
TESample.code.bin: CMakeFiles/TESample.dir/coprocessorjs.c.obj
TESample.code.bin: CMakeFiles/TESample.dir/TESample.c.obj
TESample.code.bin: CMakeFiles/TESample.dir/build.make
TESample.code.bin: CMakeFiles/TESample.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable TESample.code.bin"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TESample.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TESample.dir/build: TESample.code.bin

.PHONY : CMakeFiles/TESample.dir/build

CMakeFiles/TESample.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TESample.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TESample.dir/clean

CMakeFiles/TESample.dir/depend:
	cd /home/camh/Documents/Retro68kApps/TESample/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/camh/Documents/Retro68kApps/TESample /home/camh/Documents/Retro68kApps/TESample /home/camh/Documents/Retro68kApps/TESample/build /home/camh/Documents/Retro68kApps/TESample/build /home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles/TESample.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TESample.dir/depend
