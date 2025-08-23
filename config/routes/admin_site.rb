# frozen_string_literal: true

scope module: :admin_site, path: '/admin', as: :admin_site do
  resource :homes, only: [:show]

  resources :articles
end
