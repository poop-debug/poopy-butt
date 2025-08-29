# Use Node 20 Alpine as a lightweight base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and optionally package-lock.json (if you have it)
COPY package.json ./

# Install dependencies, ignoring optional packages and integrity errors
RUN npm install --omit=optional --legacy-peer-deps --force

# Copy the rest of your source code
COPY . .

# Expose port 3000 for Koyeb
EXPOSE 3000

# Start the app (adjust if your start command is different)
CMD ["node", "backend.js"]COPY package.json ./
RUN npm install --omit=optional --legacy-peer-deps --force
