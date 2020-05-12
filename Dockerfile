FROM okteto/okteto:1.8.4 as build
WORKDIR /usr/src/app
RUN apk add --no-cache make
RUN wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64" && chmod +x /usr/local/bin/yq

# the public URL of the repo e.g. https://charts-rberrelleza.cloud.okteto.net
ARG URL

COPY . . 
RUN echo $URL
RUN make all

FROM bitnami/nginx
COPY --from=build /usr/src/app/public /app


