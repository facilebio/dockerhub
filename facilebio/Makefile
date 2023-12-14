imagename="facilebio/facilebio"
version="latest"
tag=${imagename}:${version}

dockerdir=.
secretfile=${dockerdir}/.env
dockerfile=${dockerdir}/Dockerfile

# docker build customizations -------------------------------------------------
ifdef nocache
cache_directive=--no-cache
else
cache_directive=
endif

progress?=plain

build:
	DOCKER_BUILDKIT=1 docker build \
		--progress ${progress} \
		${cache_directive} \
		--secret id=GITHUB_PAT \
		-f ${dockerfile} \
		-t ${tag} \
		${dockerdir} \
		--platform linux/amd64

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
	docker push $(tag)
