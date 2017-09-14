PARALLEL_MAKE=-j2
SOURCE_DIR=/opt/gcclynx/src
#TARGET_gcc="powerpc-lynxos"

#PATH="$EXTPREFIX/bin:$PATH"

#touch $EXTPREFIX/$TARGET_gcc/include/gnu/stubs.h

#Build libgcc
#echo "*******************************"
#echo "*        BUILD LIBGCC         *"
#echo "*******************************"
#cd $SOURCE_DIR/cross-gcc-build
#make $PARALLEL_MAKE all-target-libgcc
#make install-target-libgcc


#Finish build gcc
echo "*******************************"
echo "*       FINISH BUILD GCC      *"
echo "*******************************"
cd $SOURCE_DIR/cross-gcc-build
make $PARALLEL_MAKE all
make install
