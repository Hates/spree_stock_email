Spree::Core::Engine.routes.draw do
  resources :stock_emails, only: :create
end
