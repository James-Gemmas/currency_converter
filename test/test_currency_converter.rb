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

  # 4. Проверяем конвертацию евро в рубли
  def test_eur_to_rub
    result = CurrencyConverter.convert(50, :eur, :rub)
    puts "Тест: 50 евро в рубли = #{result}"
    assert result.is_a?(Float), "Ошибка: результат не число"
    assert result > 0, "Ошибка: результат должен быть больше 0"
    puts "   Получилось: #{result} рублей"
  end

  # 5. Проверяем, что неправильная валюта вызывает ошибку
  def test_wrong_currency_from
    puts "Тест: пробуем конвертировать из неправильной валюты XXX"
    error = assert_raises(RuntimeError) do
      CurrencyConverter.convert(100, :xxx, :usd)
    end
    puts "   Ошибка: #{error.message}"
    assert_match /не поддерживается/, error.message, "Ошибка: сообщение должно содержать 'не поддерживается'"
  end

  # 6. Проверяем, что неправильная валюта назначения вызывает ошибку
  def test_wrong_currency_to
    puts "Тест: пробуем конвертировать в неправильную валюту YYY"
    error = assert_raises(RuntimeError) do
      CurrencyConverter.convert(100, :usd, :yyy)
    end
    puts "   Ошибка: #{error.message}"
    assert_match /не поддерживается/, error.message, "Ошибка: сообщение должно содержать 'не поддерживается'"
  end

  # 7. Проверяем, что курсы валют - это хеш (словарь)
  def test_rates_is_hash
    puts "Тест: проверяем, что курсы валют - это словарь"
    rates = CurrencyConverter.rates
    assert rates.is_a?(Hash), "Ошибка: курсы должны быть словарем (Hash)"
    puts "   Доступные валюты: #{rates.keys.join(', ')}"
    assert rates.keys.include?("USD"), "Ошибка: нет курса для USD"
    assert rates.keys.include?("EUR"), "Ошибка: нет курса для EUR"
    assert rates.keys.include?("RUB"), "Ошибка: нет курса для RUB"
  end

  # 8. Проверяем, что можно обновить курсы вручную
  def test_refresh_rates
    puts "Тест: обновляем курсы валют"
    old_rates = CurrencyConverter.rates.dup
    CurrencyConverter.refresh_rates!
    new_rates = CurrencyConverter.rates
    puts "   Курсы обновлены"
    assert new_rates.is_a?(Hash), "Ошибка: после обновления курсы должны быть словарем"
  end
end