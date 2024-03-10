add_executable(src.out
  main.cxx)
  
find_package(glm REQUIRED)
find_package(SDL2 REQUIRED)

target_compile_options(src.out PUBLIC "$<$<CONFIG:Debug>:-Og>")
target_compile_options(src.out PUBLIC
  "$<$<CONFIG:Debug>:-fsanitize=address,leak,undefined,pointer-overflow>")


target_include_directories(src.out PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_libraries(src.out PUBLIC -lasan glm::glm -lSDL2 -lpthread -ldl)
