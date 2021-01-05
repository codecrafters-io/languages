FROM mhart/alpine-node:14

WORKDIR /app

RUN npm install typescript -g && npm install @types/node -g
COPY . /app
