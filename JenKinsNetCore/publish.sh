#!/bin/sh
docker container ls -a | grep "JenKinsNetCore"
if [ $? -eq 0 ];then
    docker container stop JenKinsNetCore
    docker container rm JenKinsNetCore
    docker rmi  JenKinsNetCore
    docker network ls |grep JenKinsNetCore
    docker network rm JenKinsNetCore
fi

docker build -t JenKinsNetCore --build-arg env="Development" .
docker run -d --restart=always  -p 8012:80 --name JenKinsNetCore
