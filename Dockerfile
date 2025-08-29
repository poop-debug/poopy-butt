FROM node:20-alpine

RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY package*.json ./
RUN npm ci --force --no-audit || npm install --force --no-audit

COPY . .

EXPOSE 8080
ENV PORT=8080

CMD ["npm", "start"]
