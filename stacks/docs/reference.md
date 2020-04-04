# Reference

The Okteto Stacks manifest is a collection of services. Each service has the following properties:

## command (string, optional)

Override the default image command.

```yaml
command: bundle exec thin -p 3000
```

The command can also be a list, in a manner similar to dockerfile:

```yaml
command: ["bundle", "exec", "thin", "-p", "3000"]
```

## environment ([string], required)

Add environment variables. Specify them as an array of strings:

```yaml
environment:
  - DEV_MODE=yes
  - DB_HOST=db
```

## image (string, required)

The container image of each service.

## ports ([int], optional)

Ports exposed by each service. By default, they are only accessible from the cluster private network.

## public (bool, optional)

If the service should exposed via a public endpoint or not (default: `false`).

## replicas (bool, optional)

Specify the number of containers that should be running for each service (default: `1`).

## resources (object, optional)

Configures resource constraints. For example, to configure a service with 300 milicpus, 500Mi of memory and 5Gi of disk:

```yaml
resources:
  cpu: 300m
  memory: 500Mi
  disk: 5Gi
```

## stop_grace_period

Specify how long to wait (in seconds) when attempting to stop a container before sending SIGKILL

## volumes ([string], optional)

List of persistent volumes mounted on the contaainers sof eaach service.
