set(TEST_TARGET mytest)

add_executable(${TEST_TARGET})

target_sources(
    ${TEST_TARGET}
    PRIVATE
    test.cpp
)

target_link_libraries(
    ${TEST_TARGET}
    PRIVATE
    fmt::fmt
    GTest::gtest_main
    project_compile_flags
)

target_compile_features(${TEST_TARGET} PRIVATE cxx_std_17)

include(GoogleTest)
gtest_discover_tests(${TEST_TARGET})
