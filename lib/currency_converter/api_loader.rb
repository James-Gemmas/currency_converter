require "httparty"

module CurrencyConverter
  class ApiLoader
    include HTTParty
    base_uri "https://api.exchangerate-api.com/v4/latest"

    def self.fetch(base = "USD")
      response = get("/#{base}")
      if response.success?
        response.parsed_response["rates"]
      else
        {}
      end
    rescue StandardError => e
      puts "Ошибка загрузки курсов: #{e.message}"
      {}
    end
  end
end