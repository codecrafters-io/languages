FROM haskell:8.8-buster

WORKDIR /app

COPY stack.yaml package.yaml stack.yaml.lock /app/
RUN stack build --system-ghc --dependencies-only

# Add and Install Application Code
COPY . /app
RUN stack build
