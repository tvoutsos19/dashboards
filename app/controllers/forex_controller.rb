class ForexController < ApplicationController
 def main_page

  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  @array_of_symbols = @symbols_hash.keys

  render ({ :template => "forex_template/main_page.html.erb"})
 end

 def foreign_currency
  
  @from_symbol = params.fetch("from_currency")
  
  @raw_data = open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash = @parsed_data.fetch("symbols")
  @array_of_symbols = @symbols_hash.keys
  render ({ :template => "forex_template/step_two.html.erb"})

 end

 def exchange
  @from_symbol = params.fetch("from_currency")
  @from_link = params.fetch("hyper_link")
  
  @raw_numbers = open("https://api.exchangerate.host/convert?from=" + @from_symbol + "&to="+ @from_link).read
  @parsed_data = JSON.parse(@raw_numbers)
  @symbols_hash = @parsed_data.fetch("info")
  @dollars = @symbols_hash.fetch("rate")

  render ({ :template => "forex_template/step_three.html.erb"})
 end

end