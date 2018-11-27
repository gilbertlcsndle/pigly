Rails.application.routes.draw do
  root 'urls#new'
  resources :urls, only: [:create, :show]
  get ':short_url', to: 'urls#go_to_original_url'
end
