FROM docker.io/alpine:latest

EXPOSE 1313

RUN apk add --no-cache git hugo tini

RUN echo "#!/usr/bin/env sh" >> /entrypoint
RUN echo "/usr/bin/git clone --depth=1 \"\${REPO}\" /website" >> /entrypoint
RUN echo "/usr/bin/hugo --source /website server --bind 0.0.0.0" >> /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT [ "/sbin/tini", "--" ]
CMD [ "/entrypoint" ]
