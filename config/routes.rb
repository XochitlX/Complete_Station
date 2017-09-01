Rails.application.routes.draw do

	root 'pages#home'

  	get  '/about',   to: 'pages#about'
  	get  '/contact', to: 'pages#contact'
  	
    get    '/signup',  to: 'users#new'
    post   '/signup',  to: 'users#create'


    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

    post  '/start',     to: 'treatments#start',  as: 'start'

    post  '/medicines', to: 'medicines#create', as: 'create'
    post  '/medicines/option', to: 'medicines#option', as: 'option'
  	
    resources :users
    get  '/registred',  to:'users#registred',  as: 'registred'
    get  '/record',  to:'users#record',  as: 'record'
    post  '/record/user/:id',  to:'users#record_user',  as: 'record_user'
    post  '/users/:id/delete',  to: 'users#delete',  as: 'delete'
    post '/users/:id/edit', to: 'users#edit', as: 'to_edit'
    get 'users/:id', to: 'users#update', as: 'to_update_user'
  #root 'visitors#index'
  # get 'visitors/index'
  # post 'visitors/index'
  get   '/visitors', to: 'visitors#index',  as: 'index'
  post  '/visitors', to: 'visitors#view',   as: 'view'

  resources :events
  post  '/events/:id',  to: 'events#update',  as: 'to_update'
  post  '/events/:id/eliminate',  to: 'events#eliminate',  as: 'to_eliminate'

  get '/redirect', to: 'flows#redirect', as: 'redirect'
	get '/callback', to: 'flows#callback', as: 'callback'
	get '/calendars', to: 'flows#calendars', as: 'calendars'
	get '/calendars/:calendar_id', to: 'flows#events', as: 'events_calendars', calendar_id: /[^\/]+/
	post '/calendars/:calendar_id', to: 'flows#new_event', as: 'new_calendar', calendar_id: /[^\/]+/
	
  
  
  
end
