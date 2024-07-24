
# Set the compiler
CC=clang
CXX=clang++

# Classic CMake build
mkdir build && cd build
cmake ..
cmake --build .

# Newer CMake build
cmake -S . -B build
cmake --build build

# CMake install (inside build directory)
make install
cmake --build . --target install
cmake --install .

# CMake install (outside build directory)
make -C build install
cmake --build build --target install
cmake --install build