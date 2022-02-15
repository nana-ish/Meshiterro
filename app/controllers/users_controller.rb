class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])  #URLに記載されたIDを参考に、必要なUserモデルを取得する
     @post_images = @user.post_images.page(params[:page]) #すべての投稿を＠post_imagesに格納する
  end

  def edit
     @user = User.find(params[:id])  #URLに記載されたIDを参考に、必要なUserモデルを取得するcd

  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
