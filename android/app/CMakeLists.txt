cmake_minimum_required(VERSION 3.4.1)

file(GLOB SRC_LIST "../../ios/Runner/Classes/*")

add_library(native_add SHARED ${SRC_LIST})
