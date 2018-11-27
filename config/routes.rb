Rails.application.routes.draw do
  resources :urls

  get ':short_url', to: 'urls#go_to_original_url'
end
