# Step 1: Build React App
FROM node:18-alpine as build

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json for installing dependencies
COPY package.json package-lock.json ./

# Install the app dependencies
RUN npm install

# Copy the rest of the application
COPY . ./

# Build the React app
RUN npm run build

# Step 2: Serve the app with Nginx
FROM nginx:alpine

# Copy the build output from the build stage into Nginx's public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 for Nginx
EXPOSE 80

# Command to run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
