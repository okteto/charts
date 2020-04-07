# Okteto Stacks

A docker-compose like format to deploy applications in Kubernetes

## Why do we need Okteto Stacks?

Stacks allows you to deploy applications in Okteto Cloud using a simple docker-compose like format. Stacks are designed for developers that don't want to deal with the complexities of Kubernetes manifests or Helm charts.

The following sample illustrates how easy is to define an [application running five microservices](https://github.com/dockersamples/example-voting-app) using Stacks:

```yaml
services:
  vote:
    public: true
    image: okteto/vote:1
    replicas: 2
    ports:
      - 80

  result:
    public: true
    image: okteto/result:1
    command: node server.js
    ports:
      - 80

  worker:
    image: okteto/worker:1
    stop_grace_period: 60

  db:
    image: postgres:9.4
    environment:
      - POSTGRES_HOST_AUTH_METHOD=trust
    ports:
      - 5432
    volumes:
      - /var/lib/postgresql/data
    resources:
      cpu: 300m
      memory: 500Mi
      disk: 5Gi

  redis:
    image: redis:alpine
    ports:
      - 6379
```

The equivalent Helm chart would have more than 400 lines of yaml!

Links:

- [Stack YAML reference](docs/reference.md)
- [Using Okteto Stacks with the Helm CLI](docs/helm-cli.md)