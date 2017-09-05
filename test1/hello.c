#include <stdio.h>
#include <unistd.h>

void main(int argc, char* argv[])
{
    printf("Hello world\n");
    printf("I'm process %d\n",getpid());
}
