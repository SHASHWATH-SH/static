# Base image
FROM nginx:alpine

# Set working directory
WORKDIR /app

# Copy built React files from build folder to Nginx's html folder
COPY build /usr/share/nginx/html

# Expose port 80 to outside the container
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
