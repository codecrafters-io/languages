FROM golang:1.13-alpine

RUN apk add curl

ARG reporter_version=v10
ARG logstream_version=v21
ARG docker_explorer_version=v17

# Add Fetch
RUN curl -o /bin/fetch -L https://github.com/gruntwork-io/fetch/releases/download/v0.3.7/fetch_linux_amd64
RUN chmod +x /bin/fetch

# Download Reporter
ARG reporter_github_token
RUN mkdir /tmp/reporter
RUN GITHUB_OAUTH_TOKEN=${reporter_github_token} fetch --repo="https://github.com/rohitpaulk/codecrafters-reporter" --tag=${reporter_version} --release-asset=${reporter_version}_linux_amd64 /tmp/reporter
RUN mv /tmp/reporter/* /bin/codecrafters-reporter
RUN chmod +x /bin/codecrafters-reporter

# Download tester
ARG docker_tester_version=v23
ARG tester_github_token
RUN mkdir /tmp/tester
RUN GITHUB_OAUTH_TOKEN=${tester_github_token} fetch --repo="https://github.com/codecrafters-bot/docker-tester" --tag=${docker_tester_version} --release-asset=${docker_tester_version}_linux_amd64 /tmp/tester
RUN mv /tmp/tester/* /bin/tester
RUN chmod +x /bin/tester

# Download logstream
RUN curl -Lo /bin/logstream https://github.com/codecrafters-io/logstream/releases/download/${logstream_version}/${logstream_version}_linux_amd64
RUN chmod +x /bin/logstream

# Download docker-explorer
RUN curl -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/${docker_explorer_version}/${docker_explorer_version}_linux_amd64
RUN chmod +x /usr/local/bin/docker-explorer

COPY . /app
WORKDIR /app

CMD tester
