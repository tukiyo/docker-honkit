FROM node:14-slim

MAINTAINER tukiyo3 <tukiyo3@gmail.com>

RUN npm init --yes \
 && npm install -g honkit

WORKDIR /srv/honkit
VOLUME /srv/honkit /srv/html
EXPOSE 4000 35729

CMD honkit serve || (honkit init && honkit serve)
