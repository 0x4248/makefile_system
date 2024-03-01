#include <stdbool.h>
#include <stdio.h>

#include "math.h"

int main() {
    printf("The version of this program is %s\n", FULLVERSION);
    int a = 1;
    int b = 2;
    int c = math(a, b);
    printf("%d\n", c);
    return 0;
}