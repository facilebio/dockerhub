TAG="facilebio/facilebio"
VERSION="latest"

build:
	docker build -t $(TAG):$(VERSION) .

inspect:
	docker run --rm -it $(TAG):$(VERSION)

run:
	docker run \
	  -e PASSWORD=bioc \
	  -p 8787:8787 \
	  $(TAG):$(VERSION)
