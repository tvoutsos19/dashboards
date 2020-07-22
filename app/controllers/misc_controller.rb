class MiscController < ApplicationController
  def homepage
    render("misc_templates/home.html.erb")
  end
end
