add_executable(
    main
    main.cpp
    myclass.cpp
)

target_include_directories(
    main
    PRIVATE
    ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries(
    main
    PRIVATE
    compile_flags_interface
    fmt::fmt
)
