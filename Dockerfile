# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build <---- where everything is now

# Build phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
