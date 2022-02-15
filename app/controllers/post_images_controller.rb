class PostImagesController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のPost_imageオブジェクトを生成する。(2022/2/13)
    @post_image=PostImage.new
  end

  # 投稿データの保存追加（2022/02/13）
  def create
    @post_image = PostImage.new(post_image_params)  #1:newアクションから、ある番号のデータを持ってくる。
    @post_image.user_id = current_user.id           #2:user.id に投稿者の固有idを入れる。
    if @post_image.save                             #3:1で持ってきたデータを保存する。
        redirect_to post_images_path                #4:post_images#showのアクションに遷移。
    else
        render:new
    end
  end


  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
     @post_comment = PostComment.new
  end

  def destroy
    @post_image =  PostImage.find(params[:id])      # 削除するpostimageデータを持ってくる。
    @post_image.destroy                             # データの削除
    redirect_to post_images_path                    # PostImageの一覧ページへのパス(index)
  end

    # 投稿データのストロングパラメータ(2022/02/13追加）
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end


end
