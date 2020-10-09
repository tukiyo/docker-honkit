FROM node:14-slim

MAINTAINER tukiyo3 <tukiyo3@gmail.com>

RUN apt update \
 && apt install -y \
        git curl calibre graphviz openjdk-8-jre \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

RUN npm init --yes
RUN npm i -g honkit
RUN npm i -g gitbook-plugin-search-pro-kui
RUN npm i -g gitbook-plugin-anchors
RUN npm i -g gitbook-plugin-navigator
RUN npm i -g gitbook-plugin-collapsible-chapters
RUN npm i -g gitbook-plugin-hints
RUN npm i -g gitbook-plugin-hide-published-with
RUN npm i -g @ansanloms/honkit-plugin-uml
RUN npm i -g gitbook-plugin-swagger

ENV LANG ja_JP.UTF-8
COPY fonts.conf /root/.config/fontconfig/
COPY ipag.ttc /root/.local/share/fonts/

WORKDIR /srv/honkit
VOLUME /srv/honkit
EXPOSE 4000

CMD honkit serve || (honkit init && chmod -R +w /srv/honkit && honkit serve)
