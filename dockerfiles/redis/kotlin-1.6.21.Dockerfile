FROM openjdk:8-jdk-alpine

WORKDIR /usr/lib

# kotlinc wants bash for some reason
RUN apk add --no-cache bash && \
    wget -q https://github.com/JetBrains/kotlin/releases/download/v1.6.21/kotlin-compiler-1.6.21.zip && \
    unzip kotlin-compiler-*.zip && \
    rm kotlin-compiler-*.zip

ENV PATH $PATH:/usr/lib/kotlinc/bin

CMD ["kotlinc"]
