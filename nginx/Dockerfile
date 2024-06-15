FROM nginx:alpine3.17

RUN rm /etc/nginx/conf.d/* 

COPY ./my-nginx.conf /etc/nginx/conf.d/
COPY ./nginx.conf /etc/nginx/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]