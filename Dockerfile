FROM trzeci/emscripten:1.39.17-upstream AS wasm
WORKDIR /
COPY build.sh ./
COPY webassembly/ ./webassembly/
RUN ./build.sh

FROM node:latest AS codebase
WORKDIR /build
COPY package.json package-lock.json ./
RUN npm install
COPY . .
COPY --from=wasm /src/wasm/ ./src/wasm/
RUN npm run build

FROM nginx:1.18-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=codebase /build/build/ /frontend/build/
EXPOSE 80