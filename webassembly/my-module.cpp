#include <emscripten/bind.h>

using namespace emscripten;
using std::string;

int say_hello() {
  printf("Hello from your wasm module\n");
  return 0;
}

string hello_wasm() {
  return "Hello this is message return from `hello_wasm()`.";
}

EMSCRIPTEN_BINDINGS(my_module) {
  function("sayHello", &say_hello);
  function("helloWasm", &hello_wasm);
}