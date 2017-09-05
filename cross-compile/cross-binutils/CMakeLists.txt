
SET(TARGET_gcc "powerpc-lynxos") # reference https://gist.github.com/o11c/7ae43193769296ccf713406f5d04cd5a

ExternalProject_add(texinfo
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL http://ftp.gnu.org/gnu/texinfo/texinfo-6.4.tar.xz
        URL_MD5 2a676c8339efe6ddea0f1cb52e626d15
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --prefix=${EXTPREFIX}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)

ExternalProject_add(cross-binutils
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL https://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.xz 
        URL_MD5 87978750715952fbb9f870940e9dcbeb 
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-sysroot --target=${TARGET_gcc} --disable-nls --disable-werror --prefix=${EXTPREFIX}
        BUILD_COMMAND make
        INSTALL_COMMAND make install
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)

