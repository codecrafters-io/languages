FROM haskell:8.8.3-buster

WORKDIR /app

# Absence of this causes `stack run` to raise permissionins error
RUN mkdir -p /etc/stack
RUN echo "allow-different-user: true" > /etc/stack/config.yaml

COPY stack.yaml package.yaml stack.yaml.lock /app/

# Dummy static content to circumvent the /app doesn't exist warning
RUN mkdir /app/app
RUN echo 'main :: IO ()' >> /app/app/Main.hs
RUN echo 'main = putStrLn "Hello, World!"' >> /app/app/Main.hs

RUN stack build --dependencies-only