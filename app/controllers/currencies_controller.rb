class CurrenciesController < ApplicationController
  def list_pairs
    api_url = "https://api.exchangerate.host/symbols"
    raw_data = open(api_url).read
    parsed_data = JSON.parse(raw_data)
    @symbols = parsed_data.fetch("symbols").keys

    render("currency_templates/index.html.erb")
  end

  def first_currency
    @original_currency = params.fetch("from_currency")

    api_url = "https://api.exchangerate.host/symbols"
    raw_data = open(api_url).read
    parsed_data = JSON.parse(raw_data)
    @symbols = parsed_data.fetch("symbols").keys

    render("currency_templates/step_one.html.erb")
  end

  def convert
    @original_currency = params.fetch("from_currency")
    @destination_currency = params.fetch("to_currency")

    api_url = "https://api.exchangerate.host/convert?from=#{@original_currency}&to=#{@destination_currency}"
    raw_data = open(api_url).read
    parsed_data = JSON.parse(raw_data)
    
    @exchange_rate = parsed_data.fetch("info").fetch("rate")
    
    render("currency_templates/step_two.html.erb")
  end
end
