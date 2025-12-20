FROM python:3.13-slim

RUN pip install 'pytest-testinfra>=10,<11'

WORKDIR /workspace

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["py.test"]
