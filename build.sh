#!/usr/bin/env bash

docker build -t php5-sandbox-app ./docker/app/
docker build -t php5-sandbox-console ./docker/console/
