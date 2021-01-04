FROM mhart/alpine-node:14

RUN npm install

COPY . /app
WORKDIR /app
