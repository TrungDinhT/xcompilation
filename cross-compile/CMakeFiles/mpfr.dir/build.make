# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.7

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
CMAKE_SOURCE_DIR = /home/thanh/Bureau/projet1/cross-compile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/thanh/Bureau/projet1/cross-compile

# Utility rule file for mpfr.

# Include the progress variables for this target.
include CMakeFiles/mpfr.dir/progress.make

CMakeFiles/mpfr: CMakeFiles/mpfr-complete


CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-install
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-mkdir
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-download
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-update
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-patch
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-configure
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-build
CMakeFiles/mpfr-complete: /opt/gcclynx/src/mpfr-stamp/mpfr-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'mpfr'"
	/usr/bin/cmake -E make_directory /home/thanh/Bureau/projet1/cross-compile/CMakeFiles
	/usr/bin/cmake -E touch /home/thanh/Bureau/projet1/cross-compile/CMakeFiles/mpfr-complete
	/usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-done

/opt/gcclynx/src/mpfr-stamp/mpfr-install: /opt/gcclynx/src/mpfr-stamp/mpfr-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'mpfr'"
	cd /opt/gcclynx/src/mpfr-build && /usr/bin/cmake -E echo_append
	cd /opt/gcclynx/src/mpfr-build && /usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-install

/opt/gcclynx/src/mpfr-stamp/mpfr-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'mpfr'"
	/usr/bin/cmake -E make_directory /opt/gcclynx/src/mpfr
	/usr/bin/cmake -E make_directory /opt/gcclynx/src/mpfr-build
	/usr/bin/cmake -E make_directory /opt/gcclynx/powerpc-lynxos-toolchain
	/usr/bin/cmake -E make_directory /opt/gcclynx/tmp
	/usr/bin/cmake -E make_directory /opt/gcclynx/src/mpfr-stamp
	/usr/bin/cmake -E make_directory /tmp/src
	/usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-mkdir

/opt/gcclynx/src/mpfr-stamp/mpfr-download: /opt/gcclynx/src/mpfr-stamp/mpfr-urlinfo.txt
/opt/gcclynx/src/mpfr-stamp/mpfr-download: /opt/gcclynx/src/mpfr-stamp/mpfr-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (download, verify and extract) for 'mpfr'"
	cd /opt/gcclynx/src && /usr/bin/cmake -P /opt/gcclynx/src/mpfr-stamp/download-mpfr.cmake
	cd /opt/gcclynx/src && /usr/bin/cmake -P /opt/gcclynx/src/mpfr-stamp/verify-mpfr.cmake
	cd /opt/gcclynx/src && /usr/bin/cmake -P /opt/gcclynx/src/mpfr-stamp/extract-mpfr.cmake
	cd /opt/gcclynx/src && /usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-download

/opt/gcclynx/src/mpfr-stamp/mpfr-update: /opt/gcclynx/src/mpfr-stamp/mpfr-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'mpfr'"
	cd /opt/gcclynx/src/mpfr && /usr/bin/cmake -E echo_append

/opt/gcclynx/src/mpfr-stamp/mpfr-patch: /opt/gcclynx/src/mpfr-stamp/mpfr-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'mpfr'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-patch

/opt/gcclynx/src/mpfr-stamp/mpfr-configure: /opt/gcclynx/src/gmp-stamp/gmp-done
/opt/gcclynx/src/mpfr-stamp/mpfr-configure: /opt/gcclynx/tmp/mpfr-cfgcmd.txt
/opt/gcclynx/src/mpfr-stamp/mpfr-configure: /opt/gcclynx/src/mpfr-stamp/mpfr-update
/opt/gcclynx/src/mpfr-stamp/mpfr-configure: /opt/gcclynx/src/mpfr-stamp/mpfr-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'mpfr'"
	cd /opt/gcclynx/src/mpfr-build && /opt/gcclynx/src/mpfr/configure --with-gmp=/opt/gcclynx/powerpc-lynxos-toolchain --prefix=/opt/gcclynx/powerpc-lynxos-toolchain
	cd /opt/gcclynx/src/mpfr-build && /usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-configure

/opt/gcclynx/src/mpfr-stamp/mpfr-build: /opt/gcclynx/src/mpfr-stamp/mpfr-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/thanh/Bureau/projet1/cross-compile/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'mpfr'"
	cd /opt/gcclynx/src/mpfr-build && make install
	cd /opt/gcclynx/src/mpfr-build && /usr/bin/cmake -E touch /opt/gcclynx/src/mpfr-stamp/mpfr-build

mpfr: CMakeFiles/mpfr
mpfr: CMakeFiles/mpfr-complete
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-install
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-mkdir
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-download
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-update
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-patch
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-configure
mpfr: /opt/gcclynx/src/mpfr-stamp/mpfr-build
mpfr: CMakeFiles/mpfr.dir/build.make

.PHONY : mpfr

# Rule to build all files generated by this target.
CMakeFiles/mpfr.dir/build: mpfr

.PHONY : CMakeFiles/mpfr.dir/build

CMakeFiles/mpfr.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mpfr.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mpfr.dir/clean

CMakeFiles/mpfr.dir/depend:
	cd /home/thanh/Bureau/projet1/cross-compile && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/thanh/Bureau/projet1/cross-compile /home/thanh/Bureau/projet1/cross-compile /home/thanh/Bureau/projet1/cross-compile /home/thanh/Bureau/projet1/cross-compile /home/thanh/Bureau/projet1/cross-compile/CMakeFiles/mpfr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mpfr.dir/depend

