TvShows::Application.routes.draw do
  resources :television_shows do
    resources :characters
  end

  resources :characters
end
