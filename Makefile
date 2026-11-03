.PHONY: fmt lint check-generated generate generate-sql migrate

export PSQL_DSN ?= $(DATABASE_URL)

lint:
	go tool golangci-lint config verify
	go tool golangci-lint run
	go run github.com/fe3dback/go-arch-lint@v1.19.0 check

check-generated:
	go tool golangci-lint run --enable-only gocritic

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
	$(MAKE) check-generated

migrate:
	go run ./cmd/migrate
