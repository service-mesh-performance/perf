SITE_DIR := _site

.PHONY: site build clean

site: build
	cd $(SITE_DIR) && python3 -m http.server 4000

build: clean
	mkdir -p $(SITE_DIR)
	find . -mindepth 1 -maxdepth 1 \
		! -name '.git' \
		! -name '.github' \
		! -name '.jekyll-cache' \
		! -name '.vscode' \
		! -name 'Gemfile' \
		! -name 'Gemfile.lock' \
		! -name 'LICENSE' \
		! -name 'Makefile' \
		! -name 'README.md' \
		! -name '_site' \
		! -name '.gitignore' \
		-exec cp -R {} $(SITE_DIR)/ \;
	touch $(SITE_DIR)/.nojekyll

clean:
	rm -rf $(SITE_DIR)
