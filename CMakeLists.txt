# CMakeLists.txt
cmake_minimum_required(VERSION 3.15)

# Project name and language
project(caitlyn VERSION 1.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Define source directories
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
set(TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR}/tests)

# Collect all source files recursively
file(GLOB_RECURSE SOURCES 
    "${SRC_DIR}/*.cpp"
    "${SRC_DIR}/*.cc"
)

# Collect all header files recursively
file(GLOB_RECURSE HEADERS 
    "${INCLUDE_DIR}/*.hpp"
    "${INCLUDE_DIR}/*.h"
)

# Create the executable
add_executable(${PROJECT_NAME} ${SOURCES} ${HEADERS})

# Add include directories
target_include_directories(${PROJECT_NAME} 
    PRIVATE 
        ${INCLUDE_DIR}
        ${SRC_DIR}
)

# Set compiler warnings
if(MSVC)
    target_compile_options(${PROJECT_NAME} PRIVATE /W4)
else()
    target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)
endif()
