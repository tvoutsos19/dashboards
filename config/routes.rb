Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })
  
  get("/forex", { :controller => "currencies", :action => "index" })
  get("/forex/:from_currency/:to_currency", { :controller => "currencies", :action => "convert" })
  
  get("/covid", { :controller => "pandemic", :action => "index" })
  get("/covid/:state", { :controller => "pandemic", :action => "details" })
end
