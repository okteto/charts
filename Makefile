URL?=https://apps.okteto.com
DIRS = $(shell ls -d -- */|grep -v dist)

.PHONY: all clean dist package index $(DIRS)
all: clean package index

clean:
	rm -rf dist
	mkdir -p dist

package: $(DIRS)

$(DIRS):
	helm lint $@
	helm package $@ --destination dist/$@
	cp $@*.png dist/$@

index:
	helm repo index --url $(URL) dist
	yq w -s devs.yaml dist/index.yaml > dist/index.yaml.generated
	mv dist/index.yaml.generated dist/index.yaml
	
	
