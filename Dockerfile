# Use an official nginx image as the base image
FROM nginx:alpine

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Remove the default nginx static files
RUN rm -rf ./*

# Copy the static files to the nginx directory
COPY . .

# removing default Nginx Config file
RUN rm /etc/nginx/conf.d/default.conf

# Copy our nginx file in nginx conf.d folder
COPY ./default.conf /etc/nginx/conf.d/


# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]