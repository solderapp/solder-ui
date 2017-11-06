FROM alpine:edge as alpine
RUN apk add --no-cache ca-certificates mailcap

FROM scratch

EXPOSE 9000 80 443
VOLUME ["/var/lib/kleister"]

ENV KLEISTER_UI_ASSETS /usr/share/kleister
ENV KLEISTER_UI_STORAGE /var/lib/kleister

ENTRYPOINT ["/usr/bin/kleister-ui"]
CMD ["server"]

COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=alpine /etc/mime.types /etc/

COPY dist/static /usr/share/kleister

ARG VERSION
COPY dist/binaries/kleister-ui-$VERSION-linux-amd64 /usr/bin/kleister-ui

LABEL maintainer="Thomas Boerger <thomas@webhippie.de>"
LABEL org.label-schema.version=$VERSION
LABEL org.label-schema.name="Kleister UI"
LABEL org.label-schema.vendor="Thomas Boerger"
LABEL org.label-schema.schema-version="1.0"
