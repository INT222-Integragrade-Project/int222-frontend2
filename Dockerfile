FROM node:lts-alpine as build
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm i -f
COPY . .
RUN npm run build
EXPOSE 80
CMD [ "http-server", "dist" ]

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]