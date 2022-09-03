#include <emscripten/bind.h>

using namespace emscripten;

int say_hello() {
  printf("Hello from your wasm module\n");
  return 0;
}

int plus(int a, int b) {
  return a + b;
}

EMSCRIPTEN_BINDINGS(my_module) {
  function("sayHello", &say_hello);
  function("plus", &plus);
}