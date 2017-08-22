Rails.application.routes.draw do
  root 'visitors#index'
  resources :events

  get '/redirect', to: 'flows#redirect', as: 'redirect'
	get '/callback', to: 'flows#callback', as: 'callback'
	get '/calendars', to: 'flows#calendars', as: 'calendars'
	get '/calendars/:calendar_id', to: 'flows#events', as: 'events_calendars', calendar_id: /[^\/]+/
	post '/calendars/:calendar_id', to: 'flows#new_event', as: 'new_calendar', calendar_id: /[^\/]+/
	
  
  
  
end
