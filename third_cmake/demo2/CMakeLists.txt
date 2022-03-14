cmake_minimum_required (VERSION 3.10)

project(demo2)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

option (USE_MYMATH
	   "Use provided math implementation" ON)

configure_file (
  "${PROJECT_SOURCE_DIR}/config.h.in"
  "${PROJECT_BINARY_DIR}/config.h"
)

if(USE_MYMATH)
  include_directories("${PROJECT_SOURCE_DIR}/math")
  add_subdirectory(math)
  set(EXTRA_LIBS ${EXTRA_LIBS} MathFunctions)
#  set(EXTRA_LIBS MathFunctions)
endif(USE_MYMATH)

add_executable(demo2 demo2.cpp)
target_link_libraries(demo2  ${EXTRA_LIBS})
