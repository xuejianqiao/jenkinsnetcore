#!/bin/sh
docker container ls -a | grep "jenkinsnetcore"
if [ $? -eq 0 ];then
    docker container stop jenkinsnetcore
    docker container rm jenkinsnetcore
    docker rmi  jenkinsnetcore
    docker network ls |grep jenkinsnetcore
    docker network rm jenkinsnetcore
fi

docker build -t jenkinsnetcore --build-arg env="Development" .
docker run -d --restart=always  -p 8012:80 --name jenkinsnetcore jenkinsnetcore
