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
	curl $(URL)/index.yaml -o public/index.yaml
	helm repo index --merge public/index.yaml --url $(URL) public
	
publish:
	gsutil -m -h "Cache-Control:public, max-age=60" rsync -r public gs://apps.okteto.com

dev:
	okteto build -t okteto/charts:dev --target build .
