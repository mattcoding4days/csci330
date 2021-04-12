#include <cctype>
#include <cmath>
#include <cstdio>
#include <cstdlib>

// TEMPLATED FUNCTION THAT ACCEPTS OTHER FUNCTIONS AS PARAMETERS

// apply a binary function f to arguments x and y
// and return the result
// Assuming they might all have different data types
template <class T1, class T2, class T3>
T1 funcall(T1 (*f)(T2, T3), T2 x, T3 y) {
    return (*f)(x, y);
}

// EXAMPLES OF EXPLICIT INSTANTIATION

// explicitly instantiate funcall for data types:
//      int f(int, int)
template int funcall<int, int, int>(int (*f)(int, int), int x, int y);
//      bool f(char, char)
template bool funcall<bool, char, char>(bool (*f)(char, char), char x, char y);
//      double
template double funcall<double, float, int>(double (*f)(float, int), float x,
                                            int y);

// EXAMPLES OF USE

// test functions to use funcall with
// ----------------------------------
// x,y,result all ints:
int prod(int x, int y) { return x * y; }

// x and y have same type, result is different:
bool same(char c1, char c2) { return (c1 == c2); }

// all three are different types
double power(float f, int i) { return pow(f, i); }

int main() {
    // testing funcall
    int x = 3, y = 5;
    printf("prod(%d, %d) = %d\n", x, y, funcall(prod, x, y));

    char c1 = 'x', c2 = 'y';
    printf("same(%c, %c) = %d\n", c1, c2, funcall(same, c1, c2));

    float f = 3.5;
    int i = 2;
    printf("power(%g, %d) = %g\n", f, i, funcall(power, f, i));

    return EXIT_SUCCESS;
}
