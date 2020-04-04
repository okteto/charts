# Okteto Stacks

A docker-compose like format to deploy applications in Kubernetes

## Why do we need Okteto Stacks?

Kubernetes is an open-source project for automating deployment, scaling, and management of containers. It has rapidly become the standard to run production workloads and the community around it is just great!

But learning Kubernetes manifests can be hard for the majority of developers. Developers just want to define the docker image, ports, command, environment variables, volumes and little more. **Stacks** understands a simple docker-compose like format and uses the Helm templating system to traslate this format into Kubernetes resources. Stacks relies on Helm to deploy to Kubernetes, taking advantage of Helm declarative approach and its ecosystem.

## Sample

The next sample is the Okteto Stack definition for the well-known [Voting App](https://github.com/dockersamples/example-voting-app) application. As you can see, it is about 30 lines of yaml:

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

- [Okteto Stack YAML reference](docs/reference.md)
- [Using Okteto Stacks with the Helm CLI](docs/helm-cli.md)