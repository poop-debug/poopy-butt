# Use official Node.js Alpine image
FROM node:20-alpine

# Install build tools
RUN apk add --no-cache python3 make g++

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies in a forgiving way
RUN npm install --force --no-audit --legacy-peer-deps

# Copy the rest of the app
COPY . .

# Expose port 3000
EXPOSE 3000
ENV PORT=3000

# Start the app
CMD ["npm", "start"]
