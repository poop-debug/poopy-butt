# Use a lightweight Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for caching)
COPY package*.json ./

# Install dependencies while ignoring integrity issues
RUN npm install --omit=optional --no-audit --force

# Copy the rest of the app
COPY . .

# Expose the port your app uses
EXPOSE 3000

# Start the app (adjust if your start command is different)
CMD ["node", "backend.js"]
