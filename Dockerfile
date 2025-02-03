FROM nginx:latest

# This command is used for removing the standard index.html that's provided by NGINX
RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html/

EXPOSE 80
