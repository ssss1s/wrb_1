FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

RUN apk update && apk add --no-cache \
    mysql-client \
    build-base \
    mysql-dev \
    python3-dev \
    bash

RUN pip install --no-cache-dir -r /temp/requirements.txt

RUN adduser --disabled-password service-user

USER service-user
