# Use Node.js as the base image
FROM node:16

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Build the React app
RUN npm run build

# Install a lightweight server to serve the static files
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 5000

# Command to run the app
CMD ["serve", "-s", "build", "-l", "5000"]
