#!/bin/bash

for d in */ ; do
    helm3 package $d --destination $d
done

helm3 repo index --url https://apps.okteto.com .
yq w -s devs.yaml index.yaml > index.yaml.generated
mv index.yaml.generated index.yaml
