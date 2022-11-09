# Quit characters not linux, like \r 
dos2unix *.sh
chmod u+x *.sh
# Create network
./docker-01-create-network-for-dns-shared.sh
# Create each microservices, view logs and exit with Ctrl+C to continue whith next one
./docker-21-build-run-ms_auth.sh
./docker-22-build-run-ms_publication.sh
./docker-23-build-run-ms_replicated_1.sh
./docker-23-build-run-ms_replicated_2.sh
./docker-23-build-run-ms_replicated_3.sh
./docker-40-build-run-ms_gateway.sh

