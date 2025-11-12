# frozen_string_literal: true

scope module: :user_site, as: :user_site do
  root to: 'homes#show'

  resource :homes, only: [:show]

  resources :articles, only: %i[index show]
end
