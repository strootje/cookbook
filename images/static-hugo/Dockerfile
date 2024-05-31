FROM docker.io/alpine:latest

EXPOSE 1313
ENV REPO=https://github.com/strootje/hugo-site-strooware

RUN apk add --no-cache git hugo tini
COPY <<'EOF' /entrypoint
#!/usr/bin/env sh
/usr/bin/git clone --depth=1 "${REPO}" /website
/usr/bin/hugo --source /website server --bind 0.0.0.0
EOF

RUN chmod +x /entrypoint
ENTRYPOINT [ "/sbin/tini", "--" ]
CMD [ "/entrypoint" ]
