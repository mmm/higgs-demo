default: version list

NAMESPACE=markmims
IMAGE=$(shell basename $(PWD))
VERSION=0.0.1

version: show-version
show-version:
	@echo "--- $@ $(VERSION) ---"

list: list-images
list-images:
	@echo "--- $@ $(IMAGE) ---"
	@docker images | grep $(IMAGE)

build:
	@echo "--- $@ $(IMAGE) ---"
	docker build -t $(IMAGE) --build-arg=HOST_UID=$(shell id -u) --build-arg=HOST_GID=$(shell id -g) --build-arg=WHO=$(shell whoami) .

tag: tag-version tag-latest 
tag-version:
	@echo "--- $@ $(VERSION) ---"
	docker tag $(IMAGE) $(NAMESPACE)/$(IMAGE):$(VERSION)

tag-latest:
	@echo "--- $@ latest---"
	docker tag $(IMAGE) $(NAMESPACE)/$(IMAGE):latest

publish: push
push: push-version push-latest 
push-version: tag-version
	@echo "--- $@ $(NAMESPACE)/$(IMAGE):$(VERSION) ---"
	docker push $(NAMESPACE)/$(IMAGE):$(VERSION)

push-latest: tag-latest
	@echo "--- $@ $(NAMESPACE)/$(IMAGE):latest ---"
	docker push $(NAMESPACE)/$(IMAGE):latest

run:
	@echo "--- $@ $(IMAGE):latest ---"
	docker run -it --rm --user $(shell id -u):$(shell id -g) $(IMAGE):latest


clean:
	rm -f *.html
	rm -f *.pdf

clobber: clean
