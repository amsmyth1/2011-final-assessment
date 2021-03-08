Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/', to: 'doctors#welcome'

resources :doctors
resources :surgeries

end
