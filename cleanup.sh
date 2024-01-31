#!/bin/bash

docker stop WoW
docker rm WoW

docker build -t wow-dev .
docker run --network host -e MAC="01-23-45-67-89-10" -e PORT="9001" --name WoW -d wow-dev