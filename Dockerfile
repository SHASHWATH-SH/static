# Use official Node.js image
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Build static files
RUN npm run build

# Use serve for static file serving
RUN npm install -g serve

# Expose port
EXPOSE 5000

# Start static server
CMD ["serve", "-s", "build", "-l", "5000"]
