## Using Okteto Stacks with the Helm CLI

Download the Okteto Charts repository:

```console
$ helm repo add okteto-charts https://apps.okteto.com
```

To deploy the stack `okteto-stack.yaml`, execute:

```console
helm upgrade --install name okteto-charts/stacks -f okteto-stack.yaml
```

To destroy it:

```console
helm uninstall name
```

To render the Kubernetes manifests:

```console
helm template name chart okteto-charts/stacks -f okteto-stack.yaml
```
