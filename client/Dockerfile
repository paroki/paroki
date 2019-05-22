FROM node:10.15-alpine

RUN mkdir -p /usr/src/client

WORKDIR /usr/src/client

RUN yarn global add node-sass
RUN yarn global add @api-platform/client-generator

# Prevent the reinstallation of node modules at every changes in the source code
COPY package.json ./
RUN yarn install

COPY . ./

CMD yarn serve
