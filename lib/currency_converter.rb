# lib/currency_converter.rb

require_relative "currency_converter/version"

module CurrencyConverter
  # Простая версия с хардкодными курсами
  RATES = {
    usd: { eur: 0.92, rub: 92.5, gbp: 0.79 },
    eur: { usd: 1.09, rub: 100.5, gbp: 0.86 },
    rub: { usd: 0.011, eur: 0.01, gbp: 0.0095 },
    gbp: { usd: 1.27, eur: 1.16, rub: 105.3 }
  }

  def self.convert(amount, from_currency, to_currency)
    from = from_currency.to_sym
    to = to_currency.to_sym
    
    return amount if from == to
    
    # Пробуем найти прямой курс
    if RATES[from] && RATES[from][to]
      return (amount * RATES[from][to]).round(2)
    end
    
    # Если прямого курса нет, пробуем через USD
    if RATES[from] && RATES[from][:usd] && RATES[:usd] && RATES[:usd][to]
      rate = RATES[:usd][to] / RATES[from][:usd]
      return (amount * rate).round(2)
    end
    
    raise "Не удалось сконвертировать #{from} в #{to}"
  end
end
