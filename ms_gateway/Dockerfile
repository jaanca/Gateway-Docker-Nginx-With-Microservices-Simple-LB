FROM nginx:1.23.2

# Tools for Troubleshooting
RUN apt update 
RUN apt -y install iputils-ping curl vim dnsutils

# Nginx Config
COPY ms_gateway/webserver_config/nginx_core.conf /etc/nginx/nginx.conf
COPY ms_gateway/webserver_config/nginx_directives.conf /etc/nginx/includes/directives.conf
COPY ms_gateway/webserver_config/nginx_routes.conf /etc/nginx/conf.d/default.conf

# Code Web Page
COPY ms_gateway/html/ /usr/share/nginx/html/

