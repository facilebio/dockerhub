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

dev:
	docker run --rm -it -d --name facilebio \
	  -v /Users/lianoglou/workspace/facilebio/public/packages:/home/rstudio/facilebio \
	  -v /Users/lianoglou/workspace/data/eyriedata:/datasets \
	  -v /Users/lianoglou/.config/rstudio:/home/rstudio/.config/rstudio \
	  -p 8080:8787 \
	  --entrypoint /init \
	  --env SHINYPROXY_USERNAME=$(USER) \
	  -e DISABLE_AUTH=true \
	  $(TAG):$(VERSION) && \
	  sleep 5 && open http://localhost:8080

push:
	docker push $(TAG):$(VERSION)
