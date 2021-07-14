FROM haskell:8.8.3-buster

WORKDIR /app

# Absence of this causes `stack run` to raise permissionins error
RUN mkdir -p /etc/stack
RUN echo "allow-different-user: true" > /etc/stack/config.yaml

COPY stack.yaml package.yaml stack.yaml.lock /app/
RUN stack build --system-ghc --dependencies-only

# Add and Install Application Code
# TODO: Find a way to only copy repo-independent files
COPY . /app
RUN stack build
