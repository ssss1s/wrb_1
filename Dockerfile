FROM python:3.9-alpine3.16

COPY requirements.txt /temp/requirements.txt
COPY service /service
WORKDIR /service
EXPOSE 8000

# Установка зависимостей, включая mysql-dev
RUN apk update && apk add --no-cache \
    mariadb-dev \  # Это позволит использовать mysql_config
    build-base \
    python3-dev \
    bash

RUN pip install --no-cache-dir -r /temp/requirements.txt

RUN adduser --disabled-password service-user

USER service-user
