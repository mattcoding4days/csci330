#include <iostream>
#include <string>

// variadic templates in C++ allow functions to take in an arbitrary
// number of parameters in a type sage way.
// The argument handling is resolved at compile time (unlike the C-style
// va-args approach, which relies on run-time type casting and hoping
// you passed the correct types!!

// basecase, just the required arguments
template <typename T>
T Sum(T x) {
    return x;
}

// general case, at least the required args and the typename
// for the next arg, everything else is captured in the ... Args
template <typename T, typename... Args>
T Sum(T front, Args... args) {
    return front + Sum(args...);
}

int main() {
    // this can now be called on any operands for which + is a valid operator
    int itotal = Sum(1, 2, 3);
    std::cout << "Sum(1, 2, 3) is: " << itotal << '\n';

    float ftotal = Sum(4.5, -3.2, 27.0);
    std::cout << "Sum(4.5, -3.2, 27.0) is: " << ftotal << '\n';

    std::string s1 = "hi ", s2 = "there!";
    std::string stotal = Sum(s1, s2);
    std::cout << "Sum(hi , and there!) is: " << stotal << '\n';

    return 0;
}
