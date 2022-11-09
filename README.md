# Description

- Using Nginx for create a gateway with load balancer for example with round-robin to backend servers or backend pools between microservices
- This code it's based from simple gateway without redundant nodes, the urls to other simple example is: https://github.com/jaanca/Gateway-Docker-Nginx-With-Microservices-Simple
- The microservices are simple example web pages
- The code it's functional and testing in windows 10 with Docker Desktop and Ubuntu 18.04 With docker engine
- The deployment process is done via basic ci/cd in powershell and linux scripts 
- Each script for create container, show de logs for troubleshotting in case exist error in code or nginx server
- Each container, have a tools for testing ping/dig or browse web (curl) in case need that, this tools can erase in production deploy

# Descripción de los archivos
    .
    |-- docs/                                        # Documentations
    |   |-- photos/                                  # Screenshots for running system
    |   |-- Software-Architecture/                   # Context Diagram from solution
    |-- ms_auth/                                     # Microservice
    |   |-- Dockerfile                               # Instructions to build container
    |   |-- index.html                               # Simple web page
    |-- ms_gateway/                                  # Microservice
    |   |-- html/                                    # Files to expose on local web server, for example the global error pages
    |   |-- webserver_config/                        # Nginx files to setup
    |   |   |-- nginx_core.conf                      # File /etc/nginx/nginx.conf to define load balancer backend pools
    |   |   |-- nginx_directives.conf                # File /etc/nginx/includes/directives.conf to define limits and other settings
    |   |   |-- nginx_routes.conf                    # File /etc/nginx/conf.d/default.conf to define path from url to proxy_pass routing
    |   |-- Dockerfile                               # Instructions to build container and and place the nginx files instead in /etc
    |   |-- index.html                               # Simple web page
    |-- ms_publication/                              # Microservice
    |   |-- Dockerfile                               # Instructions to build container
    |   |-- index.html                               # Simple web page
    |-- Scripts_CICD_Linux/                          # The same powershell scripts but for linux
    |-- docker-00-variables.ps1                      # variables to be used in the powershell console
    |-- docker-01-create-network-for-dns-shared.ps1  # Create network for containers
    |-- docker-21-build-run-ms_auth.ps1.ps1          # Build image + Run Container + View the logs container for troubleshootings the nginx service
    |-- docker-22-build-run-ms_publication.ps1       # Build image + Run Container + View the logs container for troubleshootings the nginx service
    |-- docker-40-build-run-ms_gateway.ps1           # Build image + Run Container + View the logs container for troubleshootings the nginx service
    |-- docker-90-commands-troubleshootings.ps1      # Several commands
    |-- README.md                                    # Readme file
    
# Docker Desktop

```console
System Operative: Windows 10 x64
Install Docker Desktop + WSL2
```

# Context Diagram
![Alt text](/docs/Software-Architecture/Context_and_infrastructure_Diagram.png?raw=true)

# Create Virtual Network for Docker
```console
PS C:\..> .\docker-01-create-network-for-dns-shared.ps1
```
![Alt text](/docs/photos/01.Create-Network/Screenshot_1.png?raw=true)
![Alt text](/docs/photos/01.Create-Network/Screenshot_2.png?raw=true)

# Create Microservices examples and View Logs Container
```console
Execute script, read logs and Ctrl+C to Exit to continue with next one
PS C:\..> .\docker-21-build-run-ms_auth.ps1
PS C:\..> .\docker-22-build-run-ms_publication.ps1
PS C:\..> .\docker-22-build-run-ms_replicated_1.ps1
PS C:\..> .\docker-22-build-run-ms_replicated_2.ps1
PS C:\..> .\docker-22-build-run-ms_replicated_3.ps1
PS C:\..> .\docker-40-build-run-ms_gateway.ps1
```
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_1.png?raw=true)
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_2.png?raw=true)
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_3.png?raw=true)
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_4.png?raw=true)
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_5.png?raw=true)
![Alt text](/docs/photos/02.Create-Microservice-View-Logs-Container/Screenshot_6.png?raw=true)

# Test Web Browser
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_1.png?raw=true)
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_2.png?raw=true)
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_3.png?raw=true)
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_4.png?raw=true)
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_5.png?raw=true)
![Alt text](/docs/photos/03.Test-Web-Browser/Screenshot_6.png?raw=true)

# Try on Linux
```console
# Quit characters not linux, like \r 
dos2unix *.sh
chmod u+x *.sh
# Create network
./docker-01-create-network-for-dns-shared.sh
# Create each microservices, view logs and exit with Ctrl+C to continue whith next one
./docker-21-build-run-ms_auth.sh
./docker-22-build-run-ms_publication.sh
./docker-40-build-run-ms_gateway.sh
```
![Alt text](/docs/photos/04.Try-On-Linux/Screenshot_1.png?raw=true)
![Alt text](/docs/photos/04.Try-On-Linux/Screenshot_2.png?raw=true)
![Alt text](/docs/photos/04.Try-On-Linux/Screenshot_3.png?raw=true)
![Alt text](/docs/photos/04.Try-On-Linux/Screenshot_4.png?raw=true)
![Alt text](/docs/photos/04.Try-On-Linux/Screenshot_5.png?raw=true)

