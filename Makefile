PORT := 1313
USERID := $(shell id -u):$(shell id -g) # this gets docker-created files to be written as our user, rather than root

console:
	docker run \
		-u $(USERID) \
		-it \
		-v ./src:/src \
		--entrypoint sh \
		hugomods/hugo:exts

build:
	docker run \
		-u $(USERID) \
		-p $(PORT):1313 \
		-v ./src:/src \
		hugomods/hugo:exts \
		hugo

serve:
	docker run \
		-u $(USERID) \
		-p $(PORT):1313 \
		-v ./src:/src \
		hugomods/hugo:exts \
		hugo server --disableFastRender --bind 0.0.0.0
