URL?=https://apps.okteto.com

.PHONY: all
all: lint package index merge

.PHONY: lint
lint: 
	@for f in $(shell ls -d -- */); do helm lint $${f}; done

.PHONY: package
package: 
	@for f in $(shell ls -d -- */); do helm package $${f} --destination $${f}; done

.PHONY: index
index:
	helm repo index --url $(URL) .

.PHONY: merge
merge:
	yq w -s devs.yaml index.yaml > index.yaml.generated
	mv index.yaml.generated index.yaml
