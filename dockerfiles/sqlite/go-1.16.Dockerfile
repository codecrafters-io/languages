FROM golang:1.16-alpine

COPY go.mod /app/go.mod
COPY go.sum /app/go.sum

WORKDIR /app

RUN go mod download

# Even though modules are downloaded, building them could take a while.
# Let's run go get on each module so that they're built ahead of time.
# Ref: https://github.com/montanaflynn/golang-docker-cache
RUN go mod graph | awk '{if ($1 !~ "@") print $2}' | xargs go get
