#!/bin/bash
############################################
# Load Variables
source docker-00-variables.ini

############################################
# Build + Run a sample microservice like webpage

# Local variables
containername="ms_auth"
imagename="$containername:latest"
containerPortExposetoHost=8001
dockerfile="ms_auth/Dockerfile"

# Build
# docker pull $imagename
docker build . -t $imagename -f $dockerfile

# Release
docker stop $containername
docker container rm $containername
containerPorts="$containerPortExposetoHost:$containerPortExposeInternal"
docker run -d \
    -p $containerPorts \
    --network $dockerNetworkWithDNSCommon \
    --hostname $containername \
    --name $containername \
    $imagename

url="Exposed url: http://localhost:$containerPortExposetoHost"
echo "############################################"
echo $url

# Read the final output from log container
docker logs $containername --tail -1 --follow



