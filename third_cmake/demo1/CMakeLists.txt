cmake_minimum_required (VERSION 3.10)

project(demo1)

set (Tutorial_VERSION_MAJOR 1)
set (Tutorial_VERSION_MINOR 0)

configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_BINARY_DIR}/config.h"
  )

include_directories("${PROJECT_BINARY_DIR}")

message("${PROJECT_SOURCE_DIR} ${PROJECT_BINARY_DIR}")

add_executable(demo1 demo1.cpp)