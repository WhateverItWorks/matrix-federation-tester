FROM node:latest
COPY . /src
WORKDIR /src
RUN npm install --global gulp-cli
RUN npm install
RUN gulp build
FROM node:20-alpine3.17
COPY --from=0 /src/build /usr/share/nginx/fed
