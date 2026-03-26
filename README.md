## Использование из командной строки (CLI)
После установки гема становится доступна команда currency_converter:


# Конвертация 100 долларов в евро
currency_converter 100 usd eur

# Конвертация 5000 рублей в доллары
currency_converter 5000 rub usd

# аргументов недостаточно, выводится подсказка
currency_converter 100 usd

Если гем не установлен глобально, можно запустить CLI напрямую:
ruby exe/currency_converter 100 usd eur



## Тестирование
Для запуска тестов выполните:
rake test
или
ruby test/test_currency_converter.rb

Результат успешного тестирования:
8 runs, 20 assertions, 0 failures, 0 errors



## Структура проекта

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


## Авторы
Артём Рубанов – CLI интерфейс, тестирование, документация
Ольга Ведяшкина – API интеграция, документация

## Лицензия
Проект распространяется под лицензией MIT.
