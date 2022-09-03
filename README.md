# Containerize React, WebAssembly (C++ emscripten) with Docker 

Problem: WebAssembl (WASM) is bytecode that improve performace of web at near native speed. To develop React application with Web Assembly considering Scability, Containerization is solver. So, this repository is to containerize WASM with React application and host it on Nginx

Blog: Soon.....

# Pre-Installation
1) Docker
2) NPM

# Installation
1. Build image
```bash
docker build -t docker-build-wasm .
```

2. Run container
```bash
docker run --name docker-build-wasm-container -p 8888:80 docker-build-wasm 
```

3. Go to [http://localhost:8888](http://localhost:8888) in browser

4. Open Browser's JS Console.

# Next Step and Improvement
- Break web assembly into monorepo
- Watcher (hot reload) for development of .cpp files

# Reference:
- https://web.dev/emscripten-npm/
- https://stackoverflow.com/questions/73579436/unable-to-import-compiled-javascript-file-from-emscripten-for-webassembly-c-w/73586462#73586462