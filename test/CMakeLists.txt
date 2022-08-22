# ===-----------------------------------------------------------------------===#
# Distributed under the 3-Clause BSD License. See accompanying file LICENSE or
# copy at https://opensource.org/licenses/BSD-3-Clause).
# SPDX-License-Identifier: BSD-3-Clause
# ===-----------------------------------------------------------------------===#

cmake_minimum_required(VERSION 3.14 FATAL_ERROR)

message(
  STATUS
    "adding test: standard-cpm (${CMAKE_CURRENT_BINARY_DIR}/test_standard-cpm)")
add_test(
  NAME standard-cpm
  COMMAND
    ${CMAKE_COMMAND} -S "${CMAKE_CURRENT_SOURCE_DIR}/standard-cpm" -B
    "${CMAKE_CURRENT_BINARY_DIR}/test_standard-cpm" -D
    "CPM_cryptopp-cmake_SOURCE=${CMAKE_CURRENT_SOURCE_DIR}/..")

add_custom_target(test-verbose COMMAND ${CMAKE_CTEST_COMMAND} -C Debug
                                       --verbose)
