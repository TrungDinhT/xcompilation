project (VME-cross-compilation)

cmake_minimum_required(VERSION 2.8.6)

include(ExternalProject)

# Path for download files and install files
SET(EXTERNAL_DOWNLOAD_DIR "/tmp/src")
SET(EXTPREFIX "/opt/gcclynx")


add_subdirectory(cross-gcc)
add_subdirectory(cross-binutils)


