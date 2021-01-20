FROM jfloff/alpine-python:3.8

RUN apk del git

COPY . /app
WORKDIR /app
