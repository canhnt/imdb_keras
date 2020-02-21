IMAGE=canhnt/imdb_keras
TAG=latest

.PHONY: image
image:
	docker build --tag $(IMAGE):$(TAG) .

.PHONY: publish
publish:	
	docker push $(IMAGE):$(TAG)