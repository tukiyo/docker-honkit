FROM node:14-slim

MAINTAINER tukiyo3 <tukiyo3@gmail.com>

RUN npm init --yes
RUN npm i -g honkit
RUN npm i gitbook-plugin-search-pro-kui

WORKDIR /srv/honkit
VOLUME /srv/honkit
EXPOSE 4000

CMD honkit serve || (honkit init && chmod -R +w /srv/honkit && honkit serve)
