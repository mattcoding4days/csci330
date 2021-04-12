#include <cstdio>

union charInt {
    char c;
    int i;
};

union doubleShort {
    double d;
    short s;
};

int main() {
    charInt x;
    doubleShort y;

    printf("Size of char: %ld\n", sizeof(char));
    printf("Size of int: %ld\n", sizeof(int));
    printf("Size of charInt: %ld\n", sizeof(charInt));
    printf("Address of x.c: %p\n", (void*)(&x.c));
    printf("Address of x.i: %p\n", (void*)(&x.i));
    x.c = 1;
    printf("1 stored in  x.c, viewed through x.i is: %d\n", x.i);
    printf("Size of double: %ld\n", sizeof(double));
    printf("Size of short: %ld\n", sizeof(short));
    printf("Size of doubleShort: %ld\n", sizeof(doubleShort));

    printf("Address of y.d: %p\n", (void*)(&y.d));
    printf("Address of y.s: %p\n", (void*)(&y.s));
    y.d = 5.6;
    printf("5.6 stored in y.d viewed through y.s is: %hi\n", y.s);

    return 0;
}
