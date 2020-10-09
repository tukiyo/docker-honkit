FROM node:14-slim

MAINTAINER tukiyo3 <tukiyo3@gmail.com>

# パッケージインストール用 (コンテナサイズを小さく保つ)
RUN { \
        echo " apt update \\"; \
        # 容量を抑えるための --no-install-recommends オプション
        echo " && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y \$@ \\"; \
        echo " && apt clean \\"; \
        echo " && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*"; \
    } > /usr/local/bin/pkgadd.sh \
  && chmod +x /usr/local/bin/pkgadd.sh

# PDF出力のためにcalibreが必要
RUN pkgadd.sh calibre

RUN npm init --yes
RUN npm i -g honkit
RUN npm i -g gitbook-plugin-search-pro-fixed

# PDF出力の日本語フォント設定 (これがないと日本語表示不可)
ENV LANG ja_JP.UTF-8
# 07やさしさアンチック
COPY dockerfile/07YasashisaAntique/fonts.conf /root/.config/fontconfig/
COPY dockerfile/07YasashisaAntique/07YasashisaAntique.ttf /root/.local/share/fonts/
# IPAゴシック
#COPY dockerfile/ipag/fonts.conf /root/.config/fontconfig/
#COPY dockerfile/ipag/ipag.ttc /root/.local/share/fonts/

WORKDIR /srv/honkit
VOLUME /srv/honkit
EXPOSE 4000

CMD honkit serve || (honkit init && chmod -R +w /srv/honkit && honkit serve)

# RUN pkgadd.sh git curl graphviz
# RUN npm i -g gitbook-plugin-anchors
# RUN npm i -g gitbook-plugin-navigator
# RUN npm i -g gitbook-plugin-collapsible-chapters
# RUN npm i -g gitbook-plugin-hints
# RUN npm i -g gitbook-plugin-hide-published-with
# RUN npm i -g gitbook-plugin-swagger

## honkit-plugin-uml
# RUN mkdir -p /usr/share/man/man1
# RUN pkgadd.sh openjdk-8-jre
# RUN npm i -g @ansanloms/honkit-plugin-uml
