FROM jfloff/alpine-python:3.7

RUN apk del git

COPY . /app
WORKDIR /app
