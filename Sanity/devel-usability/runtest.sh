#!/bin/bash
set -e
set -x

TEST_SOURCE=factorial.cpp
TEST_TARGET="${TEST_SOURCE/\.cpp/}"

CXXFLAGS="$(rpm --eval '%{build_cxxflags}')"
LDFLAGS="$(rpm --eval '%{build_ldflags}')"
LIBFLAGS=""

# build target using distribution-specific flags
g++ -std=c++11 $CXXFLAGS $LDFLAGS $LIBFLAGS -o $TEST_TARGET $TEST_SOURCE

# test that target exists
test -f ./$TEST_TARGET

# test that target is executable
test -x ./$TEST_TARGET

# test that target runs successfully
./$TEST_TARGET