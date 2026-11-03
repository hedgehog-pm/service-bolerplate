.PHONY: fmt lint check-generated generate generate-sql migrate

export PSQL_DSN ?= $(DATABASE_URL)

lint: check-generated
	go tool golangci-lint config verify
	go tool golangci-lint run

check-generated:
	@files="$$(find . -type f -name '*.go' \
		! -path './internal/generated/*' ! -path './vendor/*' ! -path './.git/*' \
		-exec grep -lE '^// Code generated .* DO NOT EDIT\.$$' {} +)"; \
	if [ -n "$$files" ]; then \
		printf 'Generated Go files must be in internal/generated:\n%s\n' "$$files"; \
		exit 1; \
	fi

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
