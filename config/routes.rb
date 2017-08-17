Rails.application.routes.draw do
  
  get '/redirect', to: 'flows#redirect', as: 'redirect'
	get '/callback', to: 'flows#callback', as: 'callback'
	get '/calendars', to: 'flows#calendars', as: 'calendars'
	get '/events/:calendar_id', to: 'flows#events', as: 'events', calendar_id: /[^\/]+/
	post '/events/:calendar_id', to: 'flows#new_event', as: 'new_event', calendar_id: /[^\/]+/
	
  
  root 'visitors#index'
  resources :events
  
end
