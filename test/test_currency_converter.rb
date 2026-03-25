require "minitest/autorun"
require_relative "../lib/currency_converter"

class TestCurrencyConverter < Minitest::Test
  
  # Это выполняется перед каждым тестом
  def setup
    puts "\n--- Запускаем тест ---"
  end

  # 1. Проверяем, что одинаковые валюты не меняют сумму
  def test_same_currency
    result = CurrencyConverter.convert(100, :usd, :usd)
    puts "Тест: 100 долларов в доллары = #{result}"
    assert_equal 100, result, "Ошибка: должно быть 100"
  end

  # 2. Проверяем конвертацию долларов в евро
  def test_usd_to_eur
    result = CurrencyConverter.convert(100, :usd, :eur)
    puts "Тест: 100 долларов в евро = #{result}"
    # Проверяем, что результат - число
    assert result.is_a?(Float), "Ошибка: результат не число"
    # Проверяем, что результат больше 0
    assert result > 0, "Ошибка: результат должен быть больше 0"
    # Проверяем, что результат примерно 92 (плюс-минус 10)
    assert_in_delta 92, result, 10, "Ошибка: 100 USD должно быть около 92 EUR"
  end

  # 3. Проверяем конвертацию рублей в доллары
  def test_rub_to_usd
    result = CurrencyConverter.convert(1000, :rub, :usd)
    puts "Тест: 1000 рублей в доллары = #{result}"
    assert result.is_a?(Float), "Ошибка: результат не число"
    assert result > 0, "Ошибка: результат должен быть больше 0"
    # 1000 рублей должно быть примерно 10-15 долларов
    assert result < 20, "Ошибка: 1000 RUB не может быть больше 20 USD"
  end
end