FROM alpine:edge

EXPOSE 9000 80 443
VOLUME ["/var/lib/kleister"]

RUN apk update && \
  apk add \
    ca-certificates \
    bash && \
  rm -rf \
    /var/cache/apk/* && \
  addgroup \
    -g 1000 \
    kleister && \
  adduser -D \
    -h /var/lib/kleister \
    -s /bin/bash \
    -G kleister \
    -u 1000 \
    kleister

COPY dist/static /usr/share/kleister

ARG VERSION
COPY dist/binaries/kleister-ui-$VERSION-linux-amd64 /usr/bin/

ENV KLEISTER_UI_ASSETS /usr/share/kleister
ENV KLEISTER_UI_STORAGE /var/lib/kleister

LABEL maintainer="Thomas Boerger <thomas@webhippie.de>"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.name="Kleister UI"
LABEL org.label-schema.vendor="Thomas Boerger"
LABEL org.label-schema.schema-version="1.0"

USER kleister
ENTRYPOINT ["/usr/bin/kleister-ui"]
CMD ["server"]
