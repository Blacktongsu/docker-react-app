FROM node:alpine as buiilder

WORKDIR '/usr/src/app'

COPY package.json .

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
EXPOSE 3000
COPY --from=buiilder /usr/src/app /usr/share/nginx/html
