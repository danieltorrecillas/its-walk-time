Rails.application.routes.draw do
  root 'static_pages#home'
  get '/faqs', to: 'static_pages#faqs'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get 'subscribe', to: 'subscribers#new'
end
