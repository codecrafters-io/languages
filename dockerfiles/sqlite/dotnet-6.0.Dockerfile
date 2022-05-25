FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim

COPY codecrafters-sqlite.csproj /app/codecrafters-sqlite.csproj
COPY codecrafters-sqlite.sln /app/codecrafters-sqlite.sln

RUN mkdir /app/src
RUN echo 'System.Console.WriteLine("Hello World 2!");' > /app/src/Program.cs

WORKDIR /app

RUN dotnet run --project . --configuration Release "$@" # This saves nuget packages to ~/.nuget

RUN mkdir /app-cached
RUN mv /app/obj /app-cached/obj
RUN mv /app/bin /app-cached/bin
