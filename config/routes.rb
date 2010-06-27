ActionController::Routing::Routes.draw do |map|

  map.root :controller => "problems"
  
  map.resources :users
  map.resource :account, :controller => "users"
  map.resources :problems  
  map.resource :user_session
  map.logout "/logout", :controller => "user_sessions", :action => "destroy"
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
