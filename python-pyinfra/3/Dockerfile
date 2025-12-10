FROM python:3.13-slim

RUN pip install 'pyinfra>=3,<4' \
    && pip install passlib

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y openssh-client && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["pyinfra"]
