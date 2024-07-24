#!/bin/bash

# Copyright (c) 2023 Antmicro <www.antmicro.com>
#
# SPDX-License-Identifier: Apache-2.0

set -ex

apt-get update
apt-get -qq -y install nodejs npm git
npm install -g n
n latest

PIPELINE_MANAGER_REPO="${PIPELINE_MANAGER_REPO:-https://github.com/antmicro/kenning-pipeline-manager.git}"

if [ ! -d "./kenning-pipeline-manager" ]
then
    git clone $PIPELINE_MANAGER_REPO -b v0.0.2 ./kenning-pipeline-manager
    pip3 install -e ./kenning-pipeline-manager
fi

echo "kenning-pipeline-manager version: $(git -C ./kenning-pipeline-manager rev-parse HEAD)" | tee deps.hashes
