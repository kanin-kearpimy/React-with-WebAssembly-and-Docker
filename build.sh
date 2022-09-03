#!/bin/bash

set -e

export OPTIMIZE="-Os"
export LDFLAGS="${OPTIMIZE}"
export CFLAGS="${OPTIMIZE}"
export CXXFLAGS="${OPTIMIZE}"

echo "============================================="
echo "Compiling wasm bindings"
echo "============================================="
(
    # Compile C/C++ code
    emcc \
    ${OPTIMIZE} \
    --bind \
    --no-entry \
    -s SINGLE_FILE=1 \
    -s STRICT=1 \
    -s ALLOW_MEMORY_GROWTH=1 \
    -s MALLOC=emmalloc \
    -s MODULARIZE=1 \
    -s EXPORT_ES6=1 \
    -s ENVIRONMENT=web \
    -o ./my-module.js \
    webassembly/my-module.cpp

    # Create output folder
    mkdir -p src/wasm
    # Move artifacts
    mv my-module.js src/wasm/
)
echo "============================================="
echo "Compiling wasm bindings done"
echo "============================================="