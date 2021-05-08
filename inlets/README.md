# inlets-chart

inlets combine a reverse proxy and websocket tunnels to expose your internal and development endpoints to the public Internet via an exit-node. This Helm chart lets you launch an inlet tunnel over an existing Kubernetes cluster.

To learn more about inlets go to `https://docs.inlets.dev/#/`

## TL;DR;

```console
git clone https://github.com/rberrelleza/inlets-chart.git
$ helm install my-release .
```

## Introduction

This chart launches an [inlets](https://github.com/inlets/inlets) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.13+
- Helm 3.0+

The command deploys inlets on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ git clone https://github.com/rberrelleza/inlets-chart.git
$ helm install my-release .
```

This chart is ready to be deployed in [Okteto Cloud](https://okteto.com), a free managed Kubernetes services built for Developers.

Create your free account, download your Kubernetes credentials and run:

```console
$ git clone https://github.com/rberrelleza/inlets-chart.git
$ helm install my-release . -f values-okteto.yaml
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

The following table lists the configurable parameters of the inlets chart, and their default values.
|                 Parameter                 |                                              Description                                               |                           Default                            |
|-------------------------------------------|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| `token`                                   | Token for authentication                                                                               | `inlets`                                                     |
| `disableTransportWrapping`                | Disable wrapping the transport that removes CORS headers                                               | `false`                                                      |
| `replicaCount`                            | Number of inlets Pods to run                                                                           | `1`                                                          |
| `service.annotations`                     | Service annotations                                                                                    | `{}`                                                         |
| `service.type`                            | Kubernetes Service type                                                                                | `ClusterIP`                                                  |
| `service.port`                            | Service HTTP port                                                                                      | `8000`                                                       |
| `serviceAccount.create`                   | Create a Service Account                                                                               | `false`                                                      |
| `serviceAccount.name`                     | The name of the service account to use                                                                 | `inlets-$RELEASE_NAME`                                       |
| `ingress.enabled`                         | Enable ingress controller resource                                                                     | `false`                                                      |
| `ingress.annotations`                     | Ingress annotations                                                                                    | `[]`                                                         |
| `ingress.hosts[0]`                        | Hostname to your inlets installation                                                                   | `inlets.local`                                               |
| `ingress.tls[0].hosts[0]`                 | TLS hosts                                                                                              | `inlets.local`                                               |
| `ingress.tls[0].secretName`               | TLS Secret (certificates)                                                                              | `inlets.local-tls`                                           |
| `podSecurityContext`                      | Pod Security Context                                                                                   | `{}`                                                         |
| `nodeSelector`                            | Node labels for pod assignment                                                                         | `{}`                                                         |
| `tolerations`                             | List of node taints to tolerate                                                                        | `[]`                                                         |
| `affinity`                                | Map of node/pod affinities                                                                             | `{}`                                                         |
| `podAnnotations`                          | Pod annotations                                                                                        | `{}`                                                         |
