#!/bin/bash
############################################
# Load Variables
source docker-00-variables.ini

############################################
# Create Network for communications using DNS names for containers
docker network create $dockerNetworkWithDNSCommon
