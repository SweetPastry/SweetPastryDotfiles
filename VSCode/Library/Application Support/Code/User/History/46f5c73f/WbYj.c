#include <stdio.h>

int main(){
    int i = 5;
    int j = (++i) + (++i) + (++i);
    printf("j=%d", j);

    return 1;
}