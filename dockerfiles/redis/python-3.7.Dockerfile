FROM jfloff/alpine-python:3.7

COPY . /app
WORKDIR /app

CMD tester
