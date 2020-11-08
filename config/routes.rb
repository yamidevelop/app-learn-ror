Rails.application.routes.draw do
  root 'pages#home' # name of controller and name of definition that I want 
  get 'about', to: 'pages#about'
end
