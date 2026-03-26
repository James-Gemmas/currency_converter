# CurrencyConverter

Конвертер валют на Ruby. Позволяет переводить суммы из одной валюты в другую, используя актуальные курсы. При наличии интернета загружает курсы через API, при отсутствии использует резервные значения.

## Установка

Склонируйте репозиторий и установите зависимости:

bash
git clone https://github.com/James-Gemmas/currency_converter.git
cd currency_converter
bundle install

## Использвание в коде

Подключите гем и вызовите метод convert:

require_relative 'lib/currency_converter'

# Конвертация 100 долларов в евро
puts CurrencyConverter.convert(100, :usd, :eur)

# Конвертация 5000 рублей в доллары
puts CurrencyConverter.convert(5000, :rub, :usd)

# Конвертация 50 евро в рубли
puts CurrencyConverter.convert(50, :eur, :rub)

## Поддерживаемые валюты: 

Без интернета: USD, EUR, RUB, GBP
При наличии интернета: загружаются актуальные курсы для 166 валют мира

Курсы обновляются автоматически раз в час. Принудительно обновить можно методом CurrencyConverter.refresh_rates!.