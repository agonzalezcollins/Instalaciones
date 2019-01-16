#!/usr/bin/env bash

apt-get update

apt-get install -y \
     g++ \
     default-jdk \
     python-setuptools \
     python3-virtualenv \
     python3-pip

pip3 install -U pip \
    setuptools

pip3 install virtualenv

# Create: Virtual Enviroment
virtualenv --python=python3.6 venv