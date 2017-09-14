/opt/cross/bin/powerpc-lynx-lynxos-gcc -v

echo "test of compilation"

/opt/cross/bin/powerpc-lynx-lynxos-gcc hello.c -I/opt/vcomp3/usr/include/ -L/opt/lynxos3.1.0/lib -L/opt/cross/lib -o hello 


