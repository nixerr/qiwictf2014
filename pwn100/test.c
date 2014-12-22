#include <stdio.h>


//File: test.c
//gcc -D_FORTIFY_SOURCE=2 -O2
int main(){
  char buf[256];
    fgets(buf, sizeof(buf), stdin);
      printf(buf);
}
