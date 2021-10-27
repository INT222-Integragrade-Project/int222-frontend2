FROM node:latest as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/data /usr/share/nginx/html:rw
COPY nginx/logs /var/log/nginx/:rw
COPY nginx/conf.d /etc/nginx/conf.d
COPY nginx/ssl /ssl/:rw
EXPOSE 443 80
