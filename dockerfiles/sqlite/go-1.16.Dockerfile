FROM golang:1.16-alpine

COPY go.mod /app/go.mod
COPY go.sum /app/go.sum

WORKDIR /app

RUN go mod download
