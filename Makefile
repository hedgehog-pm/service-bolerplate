.PHONY: fmt lint generate generate-sql migrate

export PSQL_DSN ?= $(DATABASE_URL)

lint:
	go tool golangci-lint config verify
	go tool golangci-lint run

fmt:
	go tool golangci-lint fmt

.PHONY: fix
fix:
	go tool golangci-lint config verify
	go tool golangci-lint run --fix ./...

generate: generate-sql

generate-sql:
	@test -n "$$PSQL_DSN" || (echo 'PSQL_DSN must point to a migrated PostgreSQL database'; exit 1)
	go tool bobgen-psql -c bobgen.yaml

migrate:
	go run ./cmd/migrate
