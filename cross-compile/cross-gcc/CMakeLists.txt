
SET(TARGET_gcc "powerpc-lynxos") # reference https://gist.github.com/o11c/7ae43193769296ccf713406f5d04cd5a


ExternalProject_add(gmp
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
	URL_MD5 f58fa8001d60c4c77595fbbb62b63c1d
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --enable-cxx --prefix=${EXTPREFIX}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)

ExternalProject_add(mpfr
        DEPENDS gmp
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL http://www.mpfr.org/mpfr-current/mpfr-3.1.5.tar.xz
        URL_MD5 c4ac246cf9795a4491e7766002cd528f
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${EXTPREFIX} --prefix=${EXTPREFIX}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)

ExternalProject_add(mpc
        DEPENDS gmp
        DEPENDS mpfr
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL ftp://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz
        URL_MD5 d6a1d5f8ddea3abd2cc3e98f58352d26
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${EXTPREFIX} --with-mpfr=${EXTPREFIX} --prefix=${EXTPREFIX}
        BUILD_COMMAND make install
        INSTALL_COMMAND ""
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)

ExternalProject_add(cross-gcc
        DEPENDS gmp
        DEPENDS mpfr
        DEPENDS mpc
        DOWNLOAD_DIR ${EXTERNAL_DOWNLOAD_DIR}
        URL ftp://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz
        URL_MD5 ff370482573133a7fcdd96cd2f552292 
        CONFIGURE_COMMAND <SOURCE_DIR>/./configure --with-gmp=${EXTPREFIX} --with-mpfr=${EXTPREFIX} --with-mpc=${EXTPREFIX} --target=${TARGET_gcc} --disable-nls --enable-languages=c,c++ --disable-werror --disable-multilib --prefix=${EXTPREFIX}
        BUILD_COMMAND make
        INSTALL_COMMAND make install COMMAND ldconfig -v
        INSTALL_DIR ${EXTPREFIX}

        UPDATE_COMMAND ""
        ALWAYS 0
        BUILD_IN_SOURCE 1
)
