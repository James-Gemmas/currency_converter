require_relative "currency_converter/version"
require_relative "currency_converter/api_loader"

module CurrencyConverter
  # Резервные курсы (если нет интернета)
  FALLBACK_RATES = {
    "USD" => 1.0,
    "EUR" => 0.92,
    "RUB" => 92.5,
    "GBP" => 0.79
  }

  @rates = nil
  @last_update = nil

  def self.rates
    # Если прошло больше часа или курсов нет — обновляем
    if @rates.nil? || @last_update.nil? || (Time.now - @last_update) > 3600
      refresh_rates!
    end
    @rates
  end

  def self.refresh_rates!
    api_rates = ApiLoader.fetch("USD")
    if api_rates.empty?
      puts "Использую резервные курсы"
      @rates = FALLBACK_RATES
    else
      @rates = api_rates
    end
    @last_update = Time.now
    @rates
  end

  def self.convert(amount, from_currency, to_currency)
    from = from_currency.to_s.upcase
    to = to_currency.to_s.upcase

    return amount if from == to

    current_rates = rates

    if current_rates[from].nil?
      raise "Валюта '#{from}' не поддерживается. Доступны: #{current_rates.keys.join(', ')}"
    end

    if current_rates[to].nil?
      raise "Валюта '#{to}' не поддерживается. Доступны: #{current_rates.keys.join(', ')}"
    end

    # Конвертация через USD (базовая валюта)
    amount_in_usd = amount / current_rates[from]
    result = amount_in_usd * current_rates[to]

    result.round(2)
  end
end