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

# Utility rule file for TESample_APPL.

# Include the progress variables for this target.
include CMakeFiles/TESample_APPL.dir/progress.make

CMakeFiles/TESample_APPL: TESample.bin


TESample.bin: TESample.code.bin
TESample.bin: TESample.r.rsrc.bin
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating TESample.bin, TESample.APPL, TESample.dsk, TESample.ad, %TESample.ad"
	/home/camh/Retro68-build/toolchain/bin/Rez /home/camh/Retro68-build/toolchain/m68k-apple-macos/RIncludes/Retro68APPL.r -I/home/camh/Retro68-build/toolchain/m68k-apple-macos/RIncludes --copy TESample.code.bin -o TESample.bin -t APPL -c ???? --cc TESample.dsk --cc TESample.APPL --cc %TESample.ad /home/camh/Documents/Retro68kApps/TESample/build/TESample.r.rsrc.bin

TESample.APPL: TESample.bin
	@$(CMAKE_COMMAND) -E touch_nocreate TESample.APPL

TESample.dsk: TESample.bin
	@$(CMAKE_COMMAND) -E touch_nocreate TESample.dsk

TESample.ad: TESample.bin
	@$(CMAKE_COMMAND) -E touch_nocreate TESample.ad

%TESample.ad: TESample.bin
	@$(CMAKE_COMMAND) -E touch_nocreate %TESample.ad

TESample.r.rsrc.bin: ../TESample.r
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating TESample.r.rsrc.bin"
	/home/camh/Retro68-build/toolchain/bin/Rez /home/camh/Documents/Retro68kApps/TESample/TESample.r -I /home/camh/Retro68-build/toolchain/m68k-apple-macos/RIncludes -o TESample.r.rsrc.bin

TESample_APPL: CMakeFiles/TESample_APPL
TESample_APPL: TESample.bin
TESample_APPL: TESample.APPL
TESample_APPL: TESample.dsk
TESample_APPL: TESample.ad
TESample_APPL: %TESample.ad
TESample_APPL: TESample.r.rsrc.bin
TESample_APPL: CMakeFiles/TESample_APPL.dir/build.make

.PHONY : TESample_APPL

# Rule to build all files generated by this target.
CMakeFiles/TESample_APPL.dir/build: TESample_APPL

.PHONY : CMakeFiles/TESample_APPL.dir/build

CMakeFiles/TESample_APPL.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TESample_APPL.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TESample_APPL.dir/clean

CMakeFiles/TESample_APPL.dir/depend:
	cd /home/camh/Documents/Retro68kApps/TESample/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/camh/Documents/Retro68kApps/TESample /home/camh/Documents/Retro68kApps/TESample /home/camh/Documents/Retro68kApps/TESample/build /home/camh/Documents/Retro68kApps/TESample/build /home/camh/Documents/Retro68kApps/TESample/build/CMakeFiles/TESample_APPL.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TESample_APPL.dir/depend
