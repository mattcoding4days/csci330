#include <stdarg.h>
#include <stdio.h>

double max(int numArgs, ...);

int main() {
    double n;
    n = max(4, 0.1, -7.0, 200.0, 12.0);
    printf("Max of 0.1, -7.0, 200.0, 12.0 is: %lf\n", n);
    n = max(1, 1002.6);
    printf("Max of 1002.6 etc is: %lf\n", n);

    n = max(3, 15.0, 10.0, 4.0);
    printf("Max of 15.0 , 10.0, 4.0 is: %lf\n", n);

    return 0;
}

double max(int numArgs, ...) {
    // initialize argument list
    va_list argList;
    va_start(argList, numArgs);

    // get the first value from the argument list
    // treating it as a double
    double biggest = va_arg(argList, double);

    // get the remaining values from the argument list,
    // again treting them as doubles
    for (int i = 1; i < numArgs; i++) {
        double n = va_arg(argList, double);
        if (n > biggest) {
            biggest = n;
        }
    }

    // dispose of the argument list
    va_end(argList);

    // return the identified maximum
    return biggest;
}
