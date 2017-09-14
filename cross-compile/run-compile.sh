#!/bin/bash

ROOT_PATH=/opt/gcclynx

#CLean phase
rm -rf cmake_install.cmake CMakeCache.txt CMakeFiles Makefile
rm -rf $ROOT_PATH/*

#Prepare phase
mkdir -p $ROOT_PATH/usr
mkdir -p $ROOT_PATH/powerpc-lynxos-toolchain

#chown root /home/thanh/Bureau/projet1/cross-compile/compile.sh
chmod 766 /home/thanh/Bureau/projet1/cross-compile/compile.sh
bash /home/thanh/Bureau/projet1/cross-compile/compile.sh
