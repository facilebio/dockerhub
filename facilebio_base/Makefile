TAG="facilebio/facilebio_base"
VERSION="latest"

build:
	docker build -t $(TAG):$(VERSION) .

inspect:
	docker run --rm -it -e PASSWORD=bioc -p 8787:8787 --entrypoint "/bin/bash" $(TAG):$(VERSION)

run:
	docker run \
	  -e PASSWORD=bioc \
	  -p 8787:8787 \
	  $(TAG):$(VERSION)

push:
	docker push $(TAG):$(VERSION) 
