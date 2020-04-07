TAG="facilebio/facilebio_base_extra"
VERSION="latest"

build:
	docker build --no-cache -t $(TAG):$(VERSION) .

inspect:
	docker run --rm -it $(TAG):$(VERSION)

push:
	docker push $(TAG):$(VERSION) 

