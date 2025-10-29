FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/terraform /usr/share/nginx/html/.github || true
EXPOSE 80
