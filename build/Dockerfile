FROM node:10-alpine

RUN apk add --update \
    bash \
    yarn

## Add your application to the docker image
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

RUN npm install -g yarn
RUN yarn add global lerna \
                   pg@latest \
                   node-fetch \
                   util \
                   xml2js \
                   dataloader \
                   lru-cache \
                   cors \
                   wsc

RUN apk add --update bash && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/mattbretl/postgraphile-plugin-connection-filter.git /plugins/connection-filter && cd /plugins/connection-filter && yarn install

RUN yarn add global postgraphile
ENV PATH="/node_modules/.bin/:${PATH}"

## Add the wait script to thdocke image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

## Launch the wait tool and then your application
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash"]

EXPOSE 5000
