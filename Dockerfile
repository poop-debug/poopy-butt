# Use Node.js 20 on Alpine Linux
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first for better caching
COPY package*.json ./

# Install dependencies (skip optional modules and avoid audit errors)
RUN npm install --omit=optional --no-audit

# Copy the rest of the source code
COPY . .

# Expose the port Holy-Unblocker listens on
EXPOSE 8080

# Set environment variable for the port
ENV PORT=8080

# Start the app
CMD ["npm", "start"]
