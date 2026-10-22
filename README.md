# service-bolerplate

Шаблон сервиса с точкой входа в `cmd/service`, настроенным линтером
и правилами работы с кодом.

Создайте сервис через `gonew`, указав путь нового модуля:

```sh
go run golang.org/x/tools/cmd/gonew@latest \
  github.com/hedgehog-pm/service-bolerplate@latest \
  github.com/hedgehog-pm/my-service
```

`gonew` создаст каталог `my-service` и заменит путь модуля и импорты.
