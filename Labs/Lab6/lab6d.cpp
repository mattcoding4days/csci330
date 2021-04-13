/* lab6: part (d) higher order functions in C++ */

#include <iostream>

int sum(int i, int j) { return i + j; }
float prod(float f, float g) { return f * g; }
std::string conc(std::string s1, std::string s2) { return s1 + s2; }

// applyBinary templated function implementation belongs here
template <typename T>
T applyBinary(T (*func)(T arg1, T arg2), T param1, T param2) {
    return (*func)(param1, param2);
}

int main() {
    std::string s = "hello";
    std::string sRes = applyBinary(conc, s, s);
    std::cout << "string result: " << sRes << '\n';

    int iRes = applyBinary(sum, 25, 100);
    std::cout << "int result: " << iRes << '\n';

    float fRes = applyBinary(prod, 1.5f, 2.1f);
    std::cout << "float result: " << fRes << '\n';

    return 0;
}
