FROM nginx

RUN rm -rf /usr/share/nginx/html/*
COPY ./src/style.css /usr/share/nginx/html
COPY ./src/script.js /usr/share/nginx/html
COPY ./src/index.html /usr/share/nginx/html


ENTRYPOINT ["nginx", "-g", "daemon off;"]