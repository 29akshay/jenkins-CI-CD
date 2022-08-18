FROM nginx:alpine
RUN echo "Hello World !" > /user/share/nginx/html/index.html
#COPY index.html /user/share/nginx/html
