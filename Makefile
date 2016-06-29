ASSETS := assets
SRC := src
WEBPACK := node_modules/.bin/webpack
ESLINT := node_modules/.bin/eslint

all: deps build

deps:
	npm install

build: dir
	$(WEBPACK) -p

watch: dir
	$(WEBPACK) -d -w

serve:
	go run server.go --scheme=http --host=localhost:8080

dir:
	mkdir -p $(ASSETS)

test:
	@echo "Should test here ;)"

lint:
	$(ESLINT) $(SRC)/

clean:
	rm -rf $(ASSETS)

.PHONY: all deps build watch serve dir test lint clean
