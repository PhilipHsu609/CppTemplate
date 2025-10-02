# Compiler Flags Configuration
# 
# This file defines an interface library 'project_compile_flags' that can be
# linked to targets to apply consistent compiler flags across the project.
# 
# Usage: target_link_libraries(my_target PRIVATE project_compile_flags)

# Define an interface library for compile flags
add_library(project_compile_flags INTERFACE)

# Common compiler warnings and flags
target_compile_options(project_compile_flags INTERFACE
    -Wall                       # Enable all common warnings
    -Wextra                     # Enable extra warnings
    -Wshadow                    # Warn on variable shadowing
    -Wnon-virtual-dtor          # Warn on non-virtual destructors
    -Wold-style-cast            # Warn on C-style casts
    -Wcast-align                # Warn on pointer casts with alignment issues
    -Woverloaded-virtual        # Warn on overloaded virtual functions
    -Wconversion                # Warn on implicit conversions
    -Wsign-conversion           # Warn on sign conversions
    -Wmisleading-indentation    # Warn on misleading indentation
    -Wnull-dereference          # Warn on null pointer dereferences
    -pedantic                   # Warn on language extensions
    $<$<CONFIG:DEBUG>:-g>       # Debug symbols in Debug builds
    $<$<CONFIG:RELEASE>:-O3>    # Optimization level 3 in Release builds
)

# Platform-specific flags
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_options(project_compile_flags INTERFACE
        /W4                     # Warning level 4 (MSVC)
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    target_compile_options(project_compile_flags INTERFACE
        -Werror                 # Treat warnings as errors on Linux
    )
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    target_compile_options(project_compile_flags INTERFACE
        -Wshorten-64-to-32      # Warn on 64-bit to 32-bit conversions (macOS)
    )
endif()

