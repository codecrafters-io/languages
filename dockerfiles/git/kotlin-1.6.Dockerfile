FROM openjdk:17-jdk-alpine

WORKDIR /usr/lib

# kotlinc wants bash for some reason
RUN apk add --no-cache bash && \
    wget -q https://github.com/JetBrains/kotlin/releases/download/v1.6.21/kotlin-compiler-1.6.21.zip && \
    unzip kotlin-compiler-*.zip && \
    rm kotlin-compiler-*.zip

ENV PATH $PATH:/usr/lib/kotlinc/bin

COPY app/build.gradle.kts /app/app/build.gradle.kts
COPY gradle /app/gradle
COPY gradlew /app/gradlew
COPY settings.gradle.kts /app/settings.gradle.kts

RUN mkdir -p /app/app/src/main/kotlin/codecrafters/git
RUN echo 'package codecrafters.git' >> /app/app/src/main/kotlin/codecrafters/git/App.kt
RUN echo '' >> /app/app/src/main/kotlin/codecrafters/git/App.kt
RUN echo 'fun main(args: Array<String>) {' >> /app/app/src/main/kotlin/codecrafters/git/App.kt
RUN echo 'println("Logs from your program will appear here!")' >> /app/app/src/main/kotlin/codecrafters/git/App.kt
RUN echo '}' >> /app/app/src/main/kotlin/codecrafters/git/App.kt

WORKDIR /app
RUN /app/gradlew --project-dir /app --project-cache-dir ~/.gradle/codecrafters-git --no-daemon --console plain build

RUN ls -lah /app
RUN ls -lah ~/.gradle/codecrafters-git

RUN mkdir /app-cached
RUN mv /app/build /app-cached/build
