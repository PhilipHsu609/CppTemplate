# Define an interface library
add_library(project_compile_flags INTERFACE)

# Set compiler flags for the interface library
target_compile_options(project_compile_flags INTERFACE
    -Wall
    -Wextra
    -Wshadow
    -Wnon-virtual-dtor
    -Wold-style-cast
    -Wcast-align
    -Woverloaded-virtual
    -Wconversion
    -Wsign-conversion
    -Wmisleading-indentation
    -Wnull-dereference
    -pedantic
    $<$<CONFIG:DEBUG>:-g>
    $<$<CONFIG:RELEASE>:-O3>
)

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_options(project_compile_flags INTERFACE
        /W4
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_options(project_compile_flags INTERFACE
        -Werror
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    target_compile_options(project_compile_flags INTERFACE
        -Wshorten-64-to-32
    )
endif()
