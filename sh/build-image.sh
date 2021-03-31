#!/usr/bin/env bash
BASE_NAME=${1}
TAG=${2}
BASE_IMAGE=${3:-ubuntu:18.04}
PYTHON_VER=${4:-3.7.9}

SCRIPT_DIR_PATH=$(cd "$(dirname ${0})" || exit; pwd)
cd ${SCRIPT_DIR_PATH}/..

# Build the image with different arguments
docker build \
    -f docker/Dockerfile \
    -t ${BASE_NAME}:${TAG} . \
    --build-arg BASE_IMAGE=${BASE_IMAGE} \
    --build-arg PYTHON_VER=${PYTHON_VER} \
