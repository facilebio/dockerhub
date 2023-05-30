TAG="facilebio/facilebio"
VERSION="latest"

build:
	docker build --no-cache -t $(TAG):$(VERSION) .

inspect:
	docker run --rm -it \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787 \
	  -v ${HOME}/workspace/facilebio:/home/rstudio/facilebio \
	  --entrypoint "/bin/bash" $(TAG):$(VERSION)

run:
	# see here, but it didn't work to fix the error:
	# https://gist.github.com/echuber2/2dd51ab799411cbd4894f8a85a3db52c
	docker run \
	  --platform=linux/amd64 \
	  -e DISABLE_AUTH=true \
	  -p 8787:8787 \
	  -v ${HOME}/workspace/facilebio:/home/rstudio/facilebio \
	  -v "${HOME}/rocker-mounted:/home/rstudio/workspace/rocker-mounted" \
	  -u 0 \
	  $(TAG):$(VERSION) && \
	sleep 5 && echo "Open: http://localhost:8787"

dev:
	docker run --rm -it -d --name facilebio \
	  -v ${HOME}/workspace/facilebio:/home/rstudio/facilebio \
	  -v ${HOME}/workspace/facilebio/datasets:/datasets \
	  -v ${HOME}/.config/rstudio:/home/rstudio/.config/rstudio \
	  -p 8080:8787 \
	  --entrypoint /init \
	  --env SHINYPROXY_USERNAME=$(USER) \
	  -e DISABLE_AUTH=true \
	  $(TAG):$(VERSION) && \
	  sleep 5 && open http://localhost:8080

push:
	docker push $(TAG):$(VERSION)
