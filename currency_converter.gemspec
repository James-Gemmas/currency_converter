# frozen_string_literal: true

require_relative "lib/currency_converter/version"

Gem::Specification.new do |spec|
  spec.name = "currency_converter"
  spec.version = CurrencyConverter::VERSION
  spec.authors = ["Rubanov Artem, Vediashkina Olga"]
  spec.email = ["rubanov_art@mail.ru, vedyashkinaolya@gmail.com"]

  spec.summary = "Простой конвертер для валют для Ruby"
  spec.description = "Конвертирует суммы из одной валюты в другую, используя актуальные курсы. Поддерживает USD, EUR, RUB и другие валюты"
  spec.homepage = "https://github.com/James-Gemmas/currency_converter"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/James-Gemmas/currency_converter"
  spec.metadata["changelog_uri"] = "https://github.com/James-Gemmas/currency_converter/blob/main/CHANGELOG.md"

  spec.files = Dir.glob(%w[lib/**/* exe/* README.md LICENSE.txt CHANGELOG.md])
  
  spec.bindir = "exe"
  spec.executables = ["currency_converter"]
  spec.require_paths = ["lib"]

  # Зависимости
  spec.add_dependency "httparty", "~> 0.21.0"

end