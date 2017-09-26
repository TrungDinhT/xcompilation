CC=/opt/gcclynx/powerpc-lynxos-toolchain/bin/powerpc-lynxos-eabi-gcc
FLAG="-I/opt/lynxos3.1.0/usr/include -L/opt/gcclynx/lib -o"

#test gcc with -v
$CC -v


#Try to compile hello.c
#$CC -B/opt/lynxos3.1.0/usr/include hello.c -o hello
#$CC hello.c $FLAG hello
$CC hello.c  -o hello
