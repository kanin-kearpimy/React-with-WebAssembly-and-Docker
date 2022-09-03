FROM trzeci/emscripten:1.39.17-upstream AS wasm
WORKDIR /wasm
COPY build.sh ./
COPY src/wasm/ ./src/wasm/
RUN ./build.sh

FROM node:latest AS codebase
WORKDIR /build
COPY package.json package-lock.json ./
RUN npm install
COPY . .
COPY --from=wasm /wasm/src/wasm/ ./src/wasm/
RUN ls ./src/wasm
RUN npm run build

FROM nginx:1.18-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=codebase /build/build/ /frontend/build/
COPY --from=codebase /build/src/wasm/ /frontend/build/
EXPOSE 80