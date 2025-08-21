# frozen_string_literal: true

scope module: :admin_site, path: '/admin' do
  resource :homes, only: [:show]

  resources :articles
end
