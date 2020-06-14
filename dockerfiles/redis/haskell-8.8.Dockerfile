FROM haskell:8.8-buster

WORKDIR /app

COPY stack.yaml package.yaml stack.yaml.lock /app/
RUN stack build --system-ghc --dependencies-only

RUN mkdir -p /etc/stack
RUN echo "allow-different-user: true" > /etc/stack/config.yaml

# Add and Install Application Code
COPY . /app
RUN stack build
