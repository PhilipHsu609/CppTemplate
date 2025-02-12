set(EXECUTABLE_NAME main)

add_executable(${EXECUTABLE_NAME})

target_sources(
    ${EXECUTABLE_NAME}
    PRIVATE
    main.cpp
    myclass.cpp
)

target_include_directories(
    ${EXECUTABLE_NAME}
    PRIVATE
    ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries(
    ${EXECUTABLE_NAME}
    PRIVATE
    project_compile_flags
    fmt::fmt
)

target_compile_features(${EXECUTABLE_NAME} PRIVATE cxx_std_17)
