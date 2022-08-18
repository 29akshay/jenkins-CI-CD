FROM nginx:alpine
R#UN echo "Hello World !" > /user/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html
