#!/bin/bash
############################################
# Load Variables
source docker-00-variables.ini

############################################
# Build + Run a sample microservice like webpage

# Local variables
containername="ms_replicated_1"
imagename="$containername:latest"
containerPortExposetoHost=8003
dockerfile="ms_replicated_1/Dockerfile"

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
