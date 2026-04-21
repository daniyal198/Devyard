Rails.application.routes.draw do
  root "pages#home"
  get "/up", to: proc { [200, {}, ["OK"]] }
end
