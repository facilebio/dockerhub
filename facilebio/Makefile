TAG="facilebio/facilebio"
VERSION="latest"

build:
	docker build --no-cache -t $(TAG):$(VERSION) .

inspect:
	docker run --rm -it \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787 \
	  -v /Users/lianoglou/workspace/facilebio/public/packages:/home/rstudio/facilebio \
	  --entrypoint "/bin/bash" $(TAG):$(VERSION)

run:
	docker run \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787 \
	  -v /Users/lianoglou/workspace/facilebio/public/packages:/home/rstudio/facilebio \
	  $(TAG):$(VERSION)

push:
	docker push $(TAG):$(VERSION)
