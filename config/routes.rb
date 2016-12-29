Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/letras(.:format)', to: 'letras#index', as: 'letras'
  get '/letras/:id(.:format)', to: 'letras#show', as: 'letra'

  get 'creatives/index'
  root "creatives#index"

  # scope "letras/reunioes" do
  # 		 resources :reunioesletras, :path => "louvores"
  # end

  resources :reunioesletras

end
