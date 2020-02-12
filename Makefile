URL?=https://apps.okteto.com
DIRS = $(shell ls -d -- */ | grep -v public)

.PHONY: all public package index publish $(DIRS)
all: public package index

public:
	rm -rf public
	mkdir public

package: $(DIRS)

$(DIRS):
	helm lint $@
	helm package $@ --destination public/$@

index:
	helm repo index --url $(URL) public
	yq w -s devs.yaml public/index.yaml > public/index.yaml.generated
	mv public/index.yaml.generated public/index.yaml
	
publish:
	cd public; gsutil -m cp -r . gs://apps.okteto.com; cd -;
	
