# service-bolerplate

Шаблон сервиса с точкой входа в `cmd/service`, настроенным линтером
и правилами работы с кодом.

Создайте сервис и обновите путь модуля в конфигурации линтера:

```sh
go run golang.org/x/tools/cmd/gonew@latest \
  github.com/hedgehog-pm/service-bolerplate@latest \
  github.com/hedgehog-pm/my-service

perl -pi -e 's/service-bolerplate/my-service/g' my-service/.golangci.yml
```
