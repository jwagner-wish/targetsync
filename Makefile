BUILD := build
GO ?= go
GOFILES := $(shell find . -name "*.go" -type f ! -path "./vendor/*")
GOFMT ?= gofmt
GOIMPORTS ?= goimports -local=github.com/wish/targetsync

.PHONY: clean
clean:
	$(GO) clean -i ./...
	rm -rf $(BUILD)

.PHONY: fmt
fmt:
	$(GOFMT) -w -s $(GOFILES)

.PHONY: imports
imports:
	$(GOIMPORTS) -w $(GOFILES)

.PHONY: test
test:
	$(GO) test -v ./...
