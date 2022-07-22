HTML_DIR=$(shell pwd)/_build/default/src
HTML_FILE=$(HTML_DIR)/index.html

default: dev

.PHONY: dev
dev:
	dune build @src/fmt --auto-promote || true
	dune build --profile dev

.PHONY: watch
watch:
	dune build @src/fmt --auto-promote src --profile dev --watch

.PHONY: release
release:
	dune build src --profile release

.PHONY: echo-html-dir
echo-html-dir:
	@echo "$(HTML_DIR)"

.PHONY: echo-html
echo-html:
	@echo "$(HTML_FILE)"

.PHONY: repl
repl:
	dune utop src/hazelcore

.PHONY: clean
clean:
	dune clean
