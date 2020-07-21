#!/usr/bin/env bash

set -xeuo pipefail

cd $(dirname $0)/..
docker kill zap || true
docker build -f docker/Dockerfile-live -t zap2docker-live .
docker run --rm --name zap -d -u zap -p 8080:8080 -p 8090:8090 -i zap2docker-live
