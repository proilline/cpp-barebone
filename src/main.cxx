#include <iostream>
#include <cassert>
#include <nanobench.h>

int main() {
  

  uint64_t x = 1;

  ankerl::nanobench::Bench().run("++x", [&]() {
    ankerl::nanobench::doNotOptimizeAway(x += 1);
  });

}
