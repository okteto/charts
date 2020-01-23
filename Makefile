URL?=https://apps.okteto.com
DIRS = $(shell ls -d -- */)

.PHONY: all package index $(DIRS)
all: package index

package: $(DIRS)

$(DIRS):
	helm lint $@
	helm package $@ --destination $@

index:
	helm repo index --url $(URL) .
	yq w -s devs.yaml index.yaml > index.yaml.generated
	mv index.yaml.generated index.yaml
	
	
