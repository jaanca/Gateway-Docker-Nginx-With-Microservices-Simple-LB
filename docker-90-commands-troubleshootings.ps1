############################################
#
#
# The following commands are not automations, they are for manual execution
#
#
############################################

exit

# Run bash commands into the container
docker exec -it $containername sh

# Query environments variables from operative system
env

# Test ping from local container to another in the same network
ping ms_publicacion

# Read the final output from log container stopped, for example the last one
docker logs $(docker ps --all --latest -q)

# List images from local repository
docker images

# Run the image and execute bash commands into she
docker run --rm -it --entrypoint bash $imagename

# Stop all containers with state running
docker stop $(docker ps -q)

# Delete all data from docker environment (networks, images, container, etc...)
# docker system prune -a -f
