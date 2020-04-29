URL?=https://apps.okteto.com
DIRS = $(shell ls -d -- */ | grep -v public)

.PHONY: all clean package index publish $(DIRS)
all: clean package index

clean:
	rm -rf public
	helm version

package: $(DIRS)

$(DIRS):
	helm lint $@
	mkdir -p public/$@
	helm package $@ --destination public/$@
	cp $@/*.png public/$@

index:
	helm repo index --url $(URL) public
	yq merge public/index.yaml devs.yaml > public/index.yaml.generated
	mv public/index.yaml.generated public/index.yaml
	
publish:
	gsutil -m -h "Cache-Control:public, max-age=60" rsync -r public gs://apps.okteto.com

dev:
	okteto build -t okteto/charts:dev --target build .
