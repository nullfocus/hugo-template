PORT := 1313
MYUSER := $(shell id -u):$(shell id -g) # this gets docker-created files to be written as our user, rather than root

# generates a new site under /src
init:
	docker run \
		-u $(MYUSER) \
		-v ./src:/src \
		-w / \
		hugomods/hugo:exts \
		hugo new site src

# enters a shell in the hugo container
console:
	docker run \
		-u $(MYUSER) \
		-it \
		-v ./src:/src \
		--entrypoint sh \
		hugomods/hugo:exts

# builds the hugo site out to /src/public
build: clean
	docker run \
		-u $(MYUSER) \
		-p $(PORT):1313 \
		-v ./src:/src \
		hugomods/hugo:exts \
		hugo

# runs the local hugo server at localhost:1313
serve: build
	docker run \
		-u $(MYUSER) \
		-p $(PORT):1313 \
		-v ./src:/src \
		hugomods/hugo:exts \
		hugo server --disableFastRender --bind 0.0.0.0

# updates hugo by running --pull=always with a throwaway command
update-hugo:
	docker run \
		--pull=always \
		-u $(MYUSER) \
		-p $(PORT):1313 \
		-v ./src:/src \
		hugomods/hugo:exts \
		echo updated!

clean:
	rm -rf src/public
	rm -rf src/resources