#include <iostream>

//#include <tcp_server.h>
#include "tcp_server.h"

int main(int argc,char* argv[])
{
    int a[10];
    int *p;
    for(int i = 0;i<10;i++){
        scanf("%d",&a[i]);
    }
    p = a;
    for (int i = 0; i<10; i++) {
        printf("%d---",*p++);
    }
    return 0;
}