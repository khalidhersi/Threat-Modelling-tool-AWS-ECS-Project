# Stage 1: Build my react app with all its packages & dependencies
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm config set registry https://registry.npmjs.org/ && npm ci
COPY . .
RUN npm run build

# Stage 2: Preparing app to Run with Nginc
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Optional: handle routing for React Router (SPA)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

