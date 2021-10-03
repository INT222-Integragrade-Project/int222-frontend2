FROM node:12.13.0-alpine
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
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]