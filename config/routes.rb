Rails.application.routes.draw do
  resources :urls, only: [:new, :create, :show]

  get ':short_url', to: 'urls#go_to_original_url'
end
