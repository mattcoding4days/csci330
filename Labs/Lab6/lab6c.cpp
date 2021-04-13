/* lab6: part (c) variadic functions in C++ */

#include <iostream>

/*dispFractions, 1, 2, and 2+ templated function implementations belong here*/
template <typename T>
void dispFractions(T x) {
    std::cout << "(ignored leftover value " << x << ")\n";
}

template <typename T, typename K>
void dispFractions(T num, K denom) {
    std::cout << num << "/" << denom << '\n';
}

template <typename T, typename K, typename... Args>
void dispFractions(T num, K denom, Args... args) {
    std::cout << num << "/" << denom << " ";
    dispFractions(args...);
}

int main() {
    dispFractions(2, 17, 4);

    dispFractions(12, 8, 3, 4, 1, 9, 2, 101, 100, 63, 16, 7, 5);

    dispFractions(5, 0, 1, 5, 2, 27);

    return 0;
}
