FROM node:14-slim

MAINTAINER tukiyo3 <tukiyo3@gmail.com>

RUN npm init --yes
RUN npm install -g honkit

WORKDIR /srv/honkit
VOLUME /srv/honkit
EXPOSE 4000

CMD honkit serve || (honkit init && chmod +w *.md && honkit serve)
