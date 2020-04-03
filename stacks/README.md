# Okteto Stacks

A developer-first application format for running containers in Kubernetes

## Why do we need Okteto Stacks?

Helm is a powerful technology to pack you applications and deploy to Kubernetes. It has a powerful engine that makes your application definition declarative. You create new objects or modified them, and Helm takes care of upgrading your resources or deleting the ones you don't need anymore.

But learning Helm can be too complex for the majority of use cases. Developers just want to define the docker image, ports, command, environment variables, volumes and little more. **Stacks** understands a simple docker-compose like format and uses the Helm templating system to traslate this format into Kubernetes resources. Stacks relies on Helm to deploy to Kubernetes, taking advantage of Helm declarative approach and its ecosystem.

## Sample

The next sample is the Okteto Stack definition for the well-known Voting App application. As you can see, it is about 30 lines of yaml:

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

## Reference

The Okteto Stacks manifest is a collection of services. Each service has the following properties:

### command (string, optional)

Override the default image command.

```yaml
command: bundle exec thin -p 3000
```

The command can also be a list, in a manner similar to dockerfile:

```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```

### environment ([string], required)

Add environment variables. Specify them as an array of strings:

```yaml
environment:
  - DEV_MODE=yes
  - DB_HOST=db
```

### image (string, required)

The container image of each service.

### ports ([int], optional)

Ports exposed by each service. By default, they are only accessible from the cluster private network.

### public (bool, optional)

If the service should exposed via a public endpoint or not (default: `false`).


### replicas (bool, optional)

Specify the number of containers that should be running for each service (default: `1`).

### resources (object, optional)

Configures resource constraints. For example, to configure a service with 300 milicpus, 500Mi of memory and 5Gi of disk:

```yaml
resources:
  cpu: 300m
  memory: 500Mi
  disk: 5Gi
```

### stop_grace_period

Specify how long to wait (in seconds) when attempting to stop a container before sending SIGKILL

### volumes ([string], optional)

List of persistent volumes mounted on the contaainers sof eaach service.

## CLI commands

To deploy this stack yaml, execute:

```console
helm install vote chart
```

To upgrade it:

```console
helm upgrade vote chart
```

To destroy it:

```console
helm uninstall vote
```

To render the Kubernetes manifests:

```console
helm template vote chart
```
