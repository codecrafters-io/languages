FROM mhart/alpine-node:14

WORKDIR /app

ADD package.json package-lock.json /app/

RUN npm install
COPY . /app
