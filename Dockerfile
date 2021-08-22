FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
# RUN npm config set strict-ssl false
RUN npm install --verbose --legacy-peer-deps
# RUN npm install
COPY . .
RUN npm run build:prod

FROM nginx
EXPOSE 80
COPY --from=builder /app/dist/aws-deploy-test /usr/share/nginx/html
