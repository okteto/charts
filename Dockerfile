FROM okteto/okteto:1.12.3 as build
WORKDIR /usr/src/app
RUN apk add --no-cache make curl
RUN wget -O /usr/local/bin/yq "https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64" && chmod +x /usr/local/bin/yq

# the public URL of the repo e.g. https://charts-rberrelleza.cloud.okteto.net
ARG URL
ARG TASK=all

COPY . .
RUN echo $URL
RUN make $TASK

FROM bitnami/nginx:1.19
COPY --from=build /usr/src/app/public /app
