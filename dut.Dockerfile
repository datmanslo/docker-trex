ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
RUN apk add --no-cache iproute2 tcpdump
