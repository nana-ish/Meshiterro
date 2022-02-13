Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 上記3つを以下に書き換え2022年2月13日
  resources :post_images, only: [:new, :index, :show]


  # get 'homes/top'
  get 'homes/about'=>"homes#about", as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
