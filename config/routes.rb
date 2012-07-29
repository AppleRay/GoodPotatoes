Myrottenpotatoes::Application.routes.draw do
  resources :movies
  # add to routes.rb, just before or just after 'resources :movies' :

  # Route that posts 'Search TMDb' form
  post '/movies/search_tmdb'
  root :to => redirect('/movies')
end
