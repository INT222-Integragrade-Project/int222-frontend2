FROM node:lts-alpine as build
RUN npm install -g http-server
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm i -f
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]