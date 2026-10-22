.PHONY: fmt lint generate

lint:
	go tool golangci-lint config verify
	go tool golangci-lint run

fmt:
	go tool golangci-lint fmt

.PHONY: fix
fix:
	go tool golangci-lint config verify
	go tool golangci-lint run --fix ./...
