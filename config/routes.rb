Rails.application.routes.draw do
  get "valsi/:slug", to: "word#show"
  root "welcome#index"
end
