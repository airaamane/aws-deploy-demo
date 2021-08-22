FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
# RUN npm config set strict-ssl false
RUN npm install --verbose --legacy-peer-deps
# RUN npm install
COPY . .
RUN npm run build:prod

FROM nginx
COPY --from=builder /app/dist/aws-deploy-test /usr/share/nginx/html

