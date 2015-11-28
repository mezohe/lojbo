Rails.application.routes.draw do
  get "valsi/:slug", to: "word#show", as: "word"
  post "sisku", to: "word#search"
  root "welcome#index"
end
