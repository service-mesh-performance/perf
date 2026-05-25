jekyll=bundle exec jekyll
REPO_ROOT := $(shell git rev-parse --show-toplevel)
ARTIFACTHUB_SCRIPT_DIR := $(REPO_ROOT)/assets/scripts

site:
	bundle install; $(jekyll) serve --drafts --config _config.yml

site-no-incremental:
	bundle install; $(jekyll) serve --drafts --livereload --config _config.yml

build:
	$(jekyll) build --drafts

docker:
	docker run --name meshery-io -d --rm -p 4000:4000 -v `pwd`:"/srv/jekyll" jekyll/jekyll:latest bash -c "bundle install; jekyll serve --drafts --livereload"

docker-stop:
	docker stop meshery-io

.PHONY: clean
clean:
	rm -rf _site
	rm -rf .jekyll-metadata
	rm -rf .jekyll-cache
	docker stop meshery-io || true
	docker rm meshery-io || true
