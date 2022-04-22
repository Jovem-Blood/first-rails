Rails.application.routes.draw do
  root 'articles#index'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  get 'my-articles', to: 'articles#user_articles'
  resources :articles do
    resources :comments
  end
end
