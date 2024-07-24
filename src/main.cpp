#include <project/myclass.hpp>

#include <fmt/core.h>

int main() {
    A::print();

    const unsigned long a = -1;
    const int b = 2;

    fmt::print("{}\n", a > b);

    return 0;
}