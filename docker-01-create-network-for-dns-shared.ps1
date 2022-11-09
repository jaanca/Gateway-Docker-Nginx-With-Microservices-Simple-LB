############################################
# Load Variables
. .\docker-00-variables.ps1

############################################
# Create Network for communications using DNS names for containers
docker network create $dockerNetworkWithDNSCommon
