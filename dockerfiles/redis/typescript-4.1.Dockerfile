FROM mhart/alpine-node:14

RUN npm install
RUN ./node_modules/.bin/tsc --build tsconfig.json

COPY . /app
WORKDIR /app
