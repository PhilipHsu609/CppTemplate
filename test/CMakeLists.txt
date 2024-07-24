set(TEST_TARGET mytest)

add_executable(
    ${TEST_TARGET}
    test.cpp
)

target_link_libraries(
    ${TEST_TARGET}
    PRIVATE
    fmt::fmt
    GTest::gtest_main
)

include(GoogleTest)
gtest_discover_tests(${TEST_TARGET})
