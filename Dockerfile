FROM node:lts-alpine as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html

EXPOSE 80

CMD sed -i -e "s/{{ SEARCH_URL }}/$SEARCH_URL/g" /usr/share/nginx/html/js/app.*.js && \
    nginx -g "daemon off;"