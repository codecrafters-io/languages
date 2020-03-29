FROM golang:1.13-alpine

COPY . /app
WORKDIR /app

CMD tester
