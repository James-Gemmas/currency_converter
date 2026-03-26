# CurrencyConverter
Конвертер валют на Ruby. Позволяет переводить суммы из одной валюты в другую, используя актуальные курсы. При наличии интернета загружает курсы через API, при отсутствии использует резервные значения.

## Установка

Склонируйте репозиторий и установите зависимости:

```bash
git clone https://github.com/James-Gemmas/currency_converter.git
cd currency_converter
bundle install
```
## Использвание в коде

Подключите гем и вызовите метод convert:

```ruby
require_relative 'lib/currency_converter'

# Конвертация 100 долларов в евро
puts CurrencyConverter.convert(100, :usd, :eur)

# Конвертация 5000 рублей в доллары
puts CurrencyConverter.convert(5000, :rub, :usd)

# Конвертация 50 евро в рубли
puts CurrencyConverter.convert(50, :eur, :rub)
```

## Поддерживаемые валюты: 

Без интернета: USD, EUR, RUB, GBP
При наличии интернета: загружаются актуальные курсы для 166 валют мира

Курсы обновляются автоматически раз в час. Принудительно обновить можно методом CurrencyConverter.refresh_rates!.



## Использование из командной строки (CLI)
После установки гема становится доступна команда currency_converter:

```bash
# Конвертация 100 долларов в евро
currency_converter 100 usd eur

# Конвертация 5000 рублей в доллары
currency_converter 5000 rub usd

# аргументов недостаточно, выводится подсказка
currency_converter 100 usd
```

# Если гем не установлен глобально, можно запустить CLI напрямую:
```bash
ruby exe/currency_converter 100 usd eur
```


## Тестирование
Для запуска тестов выполните:
```bash
rake test
```
или
```bash
ruby test/test_currency_converter.rb
```

Результат успешного тестирования:
```text
8 runs, 20 assertions, 0 failures, 0 errors
```


## Структура проекта
```text
currency_converter/
├── exe/                        # Исполняемый файл CLI
│   └── currency_converter
├── lib/
│   ├── currency_converter.rb   # Основная логика конвертации
│   └── currency_converter/
│       ├── version.rb          # Версия гема
│       └── api_loader.rb       # Загрузка курсов через API
├── test/                       # Тесты
│   └── test_currency_converter.rb
└── README.md
```

## Авторы
Артём Рубанов – CLI интерфейс, тестирование, документация
Ольга Ведяшкина – API интеграция, документация

## Лицензия
Проект распространяется под лицензией MIT.
