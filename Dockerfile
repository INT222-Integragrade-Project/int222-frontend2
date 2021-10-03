FROM node:lts-alpine as build-stage
RUN npm install -g http-server
WORKDIR /src
COPY package*.json ./
RUN npm install
RUN npm i -f
COPY . .
RUN npm run build
EXPOSE 8080
CMD [ "http-server", "dist" ]