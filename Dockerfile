# Use a lightweight Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first for efficient caching
COPY package*.json ./

# Install dependencies (skip optional modules and avoid audit errors)
RUN npm install --omit=optional --no-audit

# Copy the rest of your app
COPY . .

# Expose the port your app uses (change if your app uses a different port)
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
