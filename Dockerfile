FROM alpine:3.5
ENV UUID=none
RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && curl -L -H "Cache-Control: no-cache" -o /xray.zip https://github.com/XTLS/Xray-core/releases/download/v1.5.4/Xray-linux-64.zip \
 && mkdir /usr/bin/xray /etc/xray \
 && touch /etc/xray/config.json \
 && unzip /xray.zip -d /usr/bin/xray \
 && rm -rf /xray.zip /usr/bin/xray/*.sig /usr/bin/xray/doc /usr/bin/xray/*.json /usr/bin/xray/*.dat /usr/bin/xray/sys* \
 && chgrp -R 0 /etc/xray \
 && chmod -R g+rwX /etc/xray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
ENTRYPOINT ["sh", "/configure.sh"]
EXPOSE 3333
