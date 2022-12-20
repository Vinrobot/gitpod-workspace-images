REPO=localhost:5000/dazzle

.PHONY: all build combine
all: build combine

build:
	dazzle build $(REPO) -v

combine:
	dazzle combine $(REPO) --all -v
