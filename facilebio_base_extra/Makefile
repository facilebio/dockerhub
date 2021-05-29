TAG="facilebio/facilebio_base_extra"
VERSION="latest"

build:
	docker build --no-cache -t $(TAG):$(VERSION) .

run:
	docker run \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787 \
	  $(TAG):$(VERSION)

inspect:
	docker run --rm -it \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787
	  --entrypoint "/bin/bash" $(TAG):$(VERSION)

push:
	docker push $(TAG):$(VERSION)

