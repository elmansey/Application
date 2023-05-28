FROM nginx:alpine

COPY ./src/index.html /usr/share/nginx/html
COPY ./src/ /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]