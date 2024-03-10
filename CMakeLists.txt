cmake_minimum_required(VERSION 3.3..3.14)

project(ds-cpp
  LANGUAGES
  CXX
  VERSION 0.0.1)

# generate compile_commands.json for clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")
if(CMAKE_EXPORT_COMPILE_COMMANDS)
  set(CMAKE_CXX_STANDARD_INCLUDE_DIRECTORIES 
      ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES})
endif()


## start release_build guard

set(CMAKE_BUILD_TYPE_PREV "${CMAKE_BUILD_TYPE}")
set(CMAKE_BUILD_TYPE Release)

# import the libraries which always should be built in release-mode
add_subdirectory(third-parties/nanobench)
add_subdirectory(third-parties/spdlog)
set(CMAKE_BUILD_TYPE "${CMAKE_BUILD_TYPE_PREV}")
## end release_build guard

set(CMAKE_CXX_CLANG_TIDY "clang-tidy")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(src/)
