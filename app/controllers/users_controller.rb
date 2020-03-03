class UsersController < ApplicationController
  def show
  	# ユーザーデータを一件取得しインスタンス変数へ渡す
  	@user = User.find(params[:id])
  	# @userに関連づけた投稿(.post_image)のみ@post_imagesに渡すことができます。
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end
end
