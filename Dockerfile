FROM alpine:3.11
MAINTAINER Carles Amigó <carles.amigo@wuaki.tv> && Roger Sanchez <roger.sanchez@wuakitv.>

ENV OAUT2PROXY_VERSION 5.0.0

RUN apk add --update --no-cache openssl ca-certificates && \
    wget https://github.com/pusher/oauth2_proxy/releases/download/v${OAUT2PROXY_VERSION}/oauth2_proxy-v${OAUT2PROXY_VERSION}.linux-amd64.go1.13.6.tar.gz && \
    tar xvzf oauth2_proxy-v${OAUT2PROXY_VERSION}.linux-amd64.go1.13.6.tar.gz && \
    mv oauth2_proxy*/oauth2_proxy /bin && \
    rm -rf oauth2_proxy* && \
    apk del --no-cache --purge openssl

ENTRYPOINT ["oauth2_proxy"]
