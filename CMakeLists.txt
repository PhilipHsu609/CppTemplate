cmake_minimum_required(VERSION 3.15)

include(cmake/debug.cmake)

set(CMAKE_TOOLCHAIN_FILE $ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake CACHE STRING "Vcpkg toolchain file")

project(
    MyProject
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED on)

# vcpkg dependencies
find_package(fmt CONFIG REQUIRED)
find_package(GTest CONFIG REQUIRED)

# Define an interface library
add_library(compile_flags_interface INTERFACE)

# Set compiler flags for the interface library
target_compile_options(compile_flags_interface INTERFACE
    -Wall
    -Wextra
    $<$<CONFIG:DEBUG>:-g>
    $<$<CONFIG:RELEASE>:-O3>
)

add_subdirectory(src)

enable_testing()
add_subdirectory(test)
