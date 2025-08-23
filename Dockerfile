# Stage 1: Build my react app with all its packages & dependencies
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Preparing app to Run
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev
EXPOSE 3000
CMD [ "npm", "run", "start" ]


