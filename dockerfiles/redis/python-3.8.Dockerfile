FROM jfloff/alpine-python:3.8

# TODO: Think bout adding pipenv?
RUN apk add curl

ARG reporter_version=v10
ARG logstream_version=v21

# Add Fetch
RUN curl -o /bin/fetch -L https://github.com/gruntwork-io/fetch/releases/download/v0.3.7/fetch_linux_amd64
RUN chmod +x /bin/fetch

# Download Reporter
ARG reporter_github_token
RUN mkdir /tmp/reporter
RUN GITHUB_OAUTH_TOKEN=${reporter_github_token} fetch --repo="https://github.com/rohitpaulk/codecrafters-reporter" --tag=${reporter_version} --release-asset=${reporter_version}_linux_amd64 /tmp/reporter
RUN mv /tmp/reporter/* /bin/codecrafters-reporter
RUN chmod +x /bin/codecrafters-reporter

# Download logstream
RUN curl -Lo /bin/logstream https://github.com/codecrafters-io/logstream/releases/download/${logstream_version}/${logstream_version}_linux_amd64
RUN chmod +x /bin/logstream

# Download tester
ARG redis_tester_version=v49
ARG tester_github_token
RUN mkdir /tmp/tester
RUN GITHUB_OAUTH_TOKEN=${tester_github_token} fetch --repo="https://github.com/codecrafters-bot/redis-tester" --tag=${redis_tester_version} --release-asset=${redis_tester_version}_linux_amd64 /tmp/tester
RUN mv /tmp/tester/* /bin/tester
RUN chmod +x /bin/tester

COPY . /app
WORKDIR /app

CMD tester
