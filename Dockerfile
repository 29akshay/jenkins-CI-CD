FROM nginx:alpine
COPY /home/ubuntu/jenkins/workspace/test-project/index.html /user/share/nginx/html
