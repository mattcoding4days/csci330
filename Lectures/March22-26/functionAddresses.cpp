#include <cstdio>

long f(long x) {
STARTF:
    long y = x * x;
    printf("STARTF address:     %p\n", &&STARTF);
    printf("parameter address:  %p\n", (void*)(&x));
    printf("local var address:  %p\n", (void*)(&y));

    return y;
}

int main() {
    printf("main\'s address:    %p\n", (void*)(main));
    printf("function f address: %p\n", (void*)(f));
    f(3);

    long (*ptr)(long); // ptr can point at functions that take/return longs
    ptr = f; // points at f
    (*ptr) (3); // call f with param of 3;

    return 0;
}
