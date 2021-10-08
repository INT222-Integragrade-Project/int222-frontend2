# build stage
FROM node:lts-alpine as build-stage
RUN npm install -g http-server
WORKDIR /src
COPY package*.json ./
RUN npm install
RUN npm i -f
COPY . .
RUN npm run build
CMD [ "http-server", "dist" ]

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
