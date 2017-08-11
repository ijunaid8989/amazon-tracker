Rails.application.routes.draw do
  get 'welcome/index'

  post "/fetch_and_add" => "scrapper#fetch_and_add"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
