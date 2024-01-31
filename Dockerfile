FROM ubuntu:latest

ENV MAC=$MAC
ENV PORT=$PORT

RUN apt-get update -y \
    && apt-get install -y webhook etherwake nano wget net-tools

RUN wget "https://raw.githubusercontent.com/erwanclx/docker-webhook-wakeonwan-/main/run.sh" && \
    chmod +x run.sh

RUN wget "https://raw.githubusercontent.com/erwanclx/docker-webhook-wakeonwan-/main/hooks.json"

ENTRYPOINT webhook -port $PORT --verbose --hooks ./hooks.json


