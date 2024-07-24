#include <fmt/core.h>
#include <gtest/gtest.h>

TEST(TestSuite, BasicAssertions) {
    EXPECT_STRNE("hello\n", fmt::format("{}\n", 42).c_str());
    EXPECT_EQ(7 * 6, 42);
}