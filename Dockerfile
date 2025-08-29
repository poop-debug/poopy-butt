FROM node:20-alpine
RUN apk add --no-cache python3 make g++
WORKDIR /app
COPY package*.json ./
RUN npm cache clean --force
RUN npm ci --force --no-audit --legacy-peer-deps || npm install --force --no-audit --legacy-peer-deps
COPY . .
EXPOSE 8080
ENV PORT=8080
CMD ["npm", "start"]
