Rails.application.routes.draw do
  # 下のresources :users, only:[:show]の重複を避けるために削除します
  # get 'users/show'
  devise_for :users

  root 'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]

  end

  resources :users, only: [:show, :edit, :update]
end
