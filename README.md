# service-bolerplate

Шаблон сервиса с точкой входа в `cmd/service`, настроенным линтером
и правилами работы с кодом.

Создайте сервис:

```sh
go run golang.org/x/tools/cmd/gonew@latest \
  github.com/hedgehog-pm/service-bolerplate@latest \
  github.com/hedgehog-pm/my-service
```

Если БД не нужна, удалите `cmd/migrate`, `migrations`, `bobgen.yaml`
и настройки БД из `Makefile`. Удалите `bobgen-psql` из блока `tool` в `go.mod`
и выполните `go mod tidy`.
