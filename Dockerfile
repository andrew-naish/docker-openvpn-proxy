FROM alpine:edge

EXPOSE 8080

RUN apk --update add privoxy openvpn runit

COPY app /app

RUN find /app -name run | xargs chmod u+x

ENV OPENVPN_FILENAME=uk-london-aes128.ovpn \
    LOCAL_NETWORK=192.168.1.0/24

CMD ["runsvdir", "/app"]
