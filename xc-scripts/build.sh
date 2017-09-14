#! /bin/bash
set -e
trap 'previous_command=$this_command; this_command=$BASH_COMMAND' DEBUG
trap 'echo FAILED COMMAND: $previous_command' EXIT


#-------------------------------------------------------------------------------------------
# This script will download packages for, configure, build and install a GCC cross-compiler.
# Customize the variables (INSTALL_PATH, TARGET, etc.) to your liking before running.
# If you get an error and need to resume the script from some point in the middle,
# just delete/comment the preceding lines before running it again.
#
# See: http://preshing.com/20141119/how-to-build-a-gcc-cross-compiler
#-------------------------------------------------------------------------------------------
DOWNLOAD_PATH=/tmp/src-xcscript
ROOT_PATH=/opt/cross
INSTALL_PATH=$ROOT_PATH #/powerpc-lynxos-toolchain
SOURCE_PATH=$ROOT_PATH/src
BUILD_PATH=$SOURCE_PATH #$ROOT_PATH/build
TARGET=powerpc-lynx-lynxos
CONFIGURATION_OPTIONS="--disable-multilib" # --disable-threads --disable-shared
NEWLIB_OPTION="--with-newlib"
PARALLEL_MAKE=-j1
BINUTILS_VERSION=binutils-2.25.1
GCC_VERSION=gcc-5.4.0
NEWLIB_VERSION=newlib-2.5.0.20170818
MPFR_VERSION=mpfr-3.1.5
GMP_VERSION=gmp-6.1.2
MPC_VERSION=mpc-1.0.3
ISL_VERSION=isl-0.12.2
CLOOG_VERSION=cloog-0.18.1
export PATH=$INSTALL_PATH/bin:$PATH

#Prequisites of gcc
#dnf install lib64gmp10 lib64mpc3 lib64mpfr4

#Clean root dir
rm -rf $ROOT_PATH/*

# Download packages
#export http_proxy=$HTTP_PROXY https_proxy=$HTTP_PROXY ftp_proxy=$HTTP_PROXY

# Extract everything
mkdir -p $SOURCE_PATH
cd $SOURCE_PATH
for f in $DOWNLOAD_PATH/*.tar*; do tar -xvf $f; done

# Make symbolic links
cd $GCC_VERSION
ln -sf `ls -1d ../mpfr-*/` mpfr
ln -sf `ls -1d ../gmp-*/` gmp
ln -sf `ls -1d ../mpc-*/` mpc
#ln -sf `ls -1d ../isl-*/` isl
#ln -sf `ls -1d ../cloog-*/` cloog
cd $ROOT_PATH

#Prepare build repository
mkdir -p $BUILD_PATH
cd $BUILD_PATH

# Step 1. Binutils
echo "*******************************"
echo "*       BUILD BINUTILS        *"
echo "*******************************"
mkdir -p build-binutils
cd build-binutils
$SOURCE_PATH/$BINUTILS_VERSION/configure --prefix=$INSTALL_PATH --target=$TARGET $CONFIGURATION_OPTIONS --disable-nls --disable-werror --with-sysroot=/opt/lynxos3.1.0
make $PARALLEL_MAKE
make install
cd $BUILD_PATH

# Step 3. C/C++ Compilers
echo "*******************************"
echo "*          BUILD GCC          *"
echo "*******************************"
mkdir -p build-gcc
cd build-gcc
$SOURCE_PATH/$GCC_VERSION/configure --prefix=$INSTALL_PATH --target=$TARGET --enable-languages=c,c++ $CONFIGURATION_OPTIONS $NEWLIB_OPTION --disable-nls --disable-werror --with-sysroot=/opt/lynxos3.1.0 --with-headers=$SOURCE_PATH/$NEWLIB_VERSION #--with-headers=/opt/lynxos3.1.0/sys/dheaders --with-headers=$SOURCE_PATH/$NEWLIB_VERSION/ 
make $PARALLEL_MAKE all-gcc
make install-gcc
cd $BUILD_PATH

# Step 7. Standard C++ Library
echo "*******************************"
echo "*        BUILD LIBGCC         *"
echo "*******************************"
cd build-gcc
make $PARALLEL_MAKE all-target-libgcc
make install-target-libgcc
cd $BUILD_PATH

# Steps 4-6. Newlib
echo "*******************************"
echo "*        BUILD NEWLIB         *"
echo "*******************************"
mkdir -p build-newlib
cd build-newlib
CC_FOR_TARGET=$INSTALL_PATH/bin/$TARGET-gcc
$SOURCE_PATH/$NEWLIB_VERSION/configure --prefix=$INSTALL_PATH --target=$TARGET $CONFIGURATION_OPTIONS
make $PARALLEL_MAKE
make install
cd $BUILD_PATH


# Step 8. Finish install GCC
echo "*******************************"
echo "*         FINISH GCC          *"
echo "*******************************"
cd build-gcc
make $PARALLEL_MAKE all
make install
cd $ROOT_PATH 

