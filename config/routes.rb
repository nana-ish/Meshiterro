Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  get 'homes/about'=>"homes#about", as: 'about'

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 上記3つを以下に書き換え（2022/02/13）
  resources :post_images, only: [:new,:create,:index,:show,:destoroy]do
    resources :post_comments, only: [:create,:destroy]
  end
  # get 'users/show'
  # get 'users/edit'
  # 上記２つを以下へ置き換え(2022/02/12)
  # updateを追加
  resources :users, only: [:show,:edit,:update]



  # get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
