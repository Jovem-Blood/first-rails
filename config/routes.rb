Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  resources :articles do
    resources :comments
  end
end
