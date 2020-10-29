Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

get("/forex", { :controller => "forex", :action => "main_page"})

get("/forex/:from_currency", { :controller => "forex", :action => "foreign_currency"})

get("/forex/:from_currency/:hyper_link", { :controller => "forex", :action => "exchange"})

end
