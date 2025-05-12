# Basic Dockerfile for static HTML
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html

