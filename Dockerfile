FROM nginx:alpine

# Copy only necessary frontend files to Nginx html directory
COPY index.html /usr/share/nginx/html/
COPY style.css /usr/share/nginx/html/

# Optional: copy any other JS or image files if you add them later
# COPY script.js /usr/share/nginx/html/
# COPY images/ /usr/share/nginx/html/images/

# Expose port 80 (the default for Nginx)
EXPOSE 80
