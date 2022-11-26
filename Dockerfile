FROM alpine:edge

ARG AUUID="d79a787e-c995-4c83-a607-18590bff07ad"
ARG CADDYIndexPage="https://github.com/WebDevSimplified/Spotify-Landing-Page-Redesign/archive/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
