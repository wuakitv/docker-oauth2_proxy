FROM alpine:3.6
MAINTAINER Carles Amigó <carles.amigo@wuaki.tv>

ENV OAUT2PROXY_VERSION 2.2

RUN apk add --update --no-cache openssl ca-certificates && \
    wget https://github.com/bitly/oauth2_proxy/releases/download/v${OAUT2PROXY_VERSION}/oauth2_proxy-${OAUT2PROXY_VERSION}.0.linux-amd64.go1.8.1.tar.gz && \
    tar xvzf oauth2_proxy-${OAUT2PROXY_VERSION}.0.linux-amd64.go1.8.1.tar.gz && \
    mv oauth2_proxy*/oauth2_proxy /bin && \
    rm -rf oauth2_proxy* && \
    apk del --no-cache --purge openssl

ENTRYPOINT ["oauth2_proxy"]
