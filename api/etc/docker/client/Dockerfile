FROM node:11.5-alpine

RUN mkdir -p /usr/src/client

WORKDIR /usr/src/client

RUN ls -l
RUN echo $PWD
RUN yarn global add @api-platform/client-generator

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
