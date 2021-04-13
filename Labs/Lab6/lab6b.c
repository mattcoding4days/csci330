/* lab6: part (b) variadic functions in C */

#include <stdarg.h>
#include <stdio.h>

/*dispFractions implementation belong here*/
void dispFractions(int numArgs, ...);


int main() {
    dispFractions(2, 17, 4);

    dispFractions(12, 8, 3, 4, 1, 9, 2, 101, 100, 63, 16, 7, 5);

    dispFractions(5, 0, 1, 5, 2, 27);

    return 0;
}

void dispFractions(int numArgs, ...) {
    // initialize argument list
    va_list argList;
    va_start(argList, numArgs);

    // get the remaining values from the argument list,
    // again treting them as doubles
    for (int i = 0; i < (numArgs / 2); i++) {
        printf("%ld/", va_arg(argList, long));
        printf("%ld ", va_arg(argList, long));

        if (((numArgs % 2) != 0) && (i == ((numArgs / 2) - 1))) {
            printf("(ignored leftover value %ld)", va_arg(argList, long));
        }
    }
    printf("\n");

    // dispose of the argument list
    va_end(argList);
}
