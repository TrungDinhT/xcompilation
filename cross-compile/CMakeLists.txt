project (VME-cross-compilation)


#Requires and policies
cmake_minimum_required(VERSION 3.0.2)


#Necessary packages
include(ExternalProject)


#Variables
SET(EXTERNAL_DOWNLOAD_DIR "/tmp/src")
SET(EXTPREFIX "/opt/gcclynx")
SET(INST_DIR "${EXTPREFIX}/powerpc-lynxos-toolchain")
SET(TARGET_gcc "powerpc-lynx-lynxos") # reference https://gist.github.com/o11c/7ae43193769296ccf713406f5d04cd5a
SET(PATH "${INST_DIR}/bin:${PATH}")


#Build binutils
ExternalProject_add(cross-binutils
	PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL https://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz
        URL_MD5 87978750715952fbb9f870940e9dcbeb
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --target=${TARGET_gcc} --disable-nls --disable-werror --disable-multilib --prefix=${INST_DIR} # --with-lib-path? --with-sysroot=/opt/lynxos3.1.0
        BUILD_COMMAND make -j2
        INSTALL_COMMAND make install #COMMAND export PATH="/opt/gcclynx/bin:$PATH"
        INSTALL_DIR ${INST_DIR}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)


#Build and Configure gcc with dependencies
ExternalProject_add(gmp
	PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
	URL_MD5 f58fa8001d60c4c77595fbbb62b63c1d
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --enable-cxx --prefix=${INST_DIR}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${INST_DIR}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)
ExternalProject_add(mpfr
        DEPENDS gmp
	PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL http://www.mpfr.org/mpfr-current/mpfr-3.1.5.tar.xz
        URL_MD5 c4ac246cf9795a4491e7766002cd528f
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${INST_DIR} --prefix=${INST_DIR}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${INST_DIR}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)
ExternalProject_add(mpc
        DEPENDS gmp
        DEPENDS mpfr
	PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
        URL_MD5 d6a1d5f8ddea3abd2cc3e98f58352d26
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${INST_DIR} --with-mpfr=${INST_DIR} --prefix=${INST_DIR}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        #INSTALL_DIR ${INST_DIR}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)


#Install and configure core compiler 1
ExternalProject_add(cross-gcc
        DEPENDS gmp
        DEPENDS mpfr
        DEPENDS mpc
	PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL ftp://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz
        URL_MD5 ff370482573133a7fcdd96cd2f552292 
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${INST_DIR} --with-mpfr=${INST_DIR} --with-mpc=${INST_DIR} --target=${TARGET_gcc} --prefix=${INST_DIR} --with-newlib --disable-nls --enable-languages=c,c++ --disable-werror --disable-multilib --with-sysroot=/opt/lynxos3.1.0 --with-headers=/opt/gcclynx/src/newlib  
	BUILD_COMMAND make -j2 all-gcc COMMAND make -j2 all-target-libgcc
	INSTALL_COMMAND make install-gcc COMMAND make install-target-libgcc #COMMAND ldconfig -v
	INSTALL_DIR ${INST_DIR}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)


#Build headers and start files
ExternalProject_add(newlib
        PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL ftp://sourceware.org/pub/newlib/newlib-2.5.0.20170818.tar.gz
        URL_MD5 cc8509d9e6f7b5e0adcdc29ac6a223a9
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --build=x86_64-mageia-linux-gnu --host=${TARGET_gcc} --target=${TARGET_gcc} --prefix=${INST_DIR} --disable-multilib 
        BUILD_COMMAND make
        INSTALL_COMMAND make install
        INSTALL_DIR ${INST_DIR}
        
        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)
#[[
SET (COMPILER "/opt/gcclynx/bin/powerpc-lynxos-gcc-7.2.0")
ExternalProject_add(glibc
        PREFIX ${EXTPREFIX}
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL http://ftp.gnu.org/gnu/glibc/glibc-2.26.tar.xz
        URL_MD5 102f637c3812f81111f48f2427611be1
	CONFIGURE_COMMAND <SOURCE_DIR>/./configure --build=x86_64-mageia-linux-gnu --host=${TARGET_gcc} --target=${TARGET_gcc} --with-headers=${EXTPREFIX}/${TARGET_gcc}/include --disable-multilib libc_cv_forced_unwind=yes
        BUILD_COMMAND make install-bootstrap-headers=yes install-headers COMMAND make -j2 csu/subdir_lib
	INSTALL_COMMAND install csu/crt1.o csu/crti.o csu/crtn.o ${EXTPREFIX}/${TARGET_gcc}/lib COMMAND ${COMPILER} -nostdlib -nostartfiles -shared -x c /dev/null -o ${EXTPREFIX}/${TARGET_gcc}/lib/libc.so

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 0
)
add_custom_target(stubs
	touch ${EXTPREFIX}/${TARGET_gcc}/include/gnu/stubs.h
	WORKING_DIRECTORY ${EXTPREFIX}/${TARGET_gcc}/include/gnu
)
]]




