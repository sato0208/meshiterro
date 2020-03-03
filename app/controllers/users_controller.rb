class UsersController < ApplicationController
  def show
  	# ユーザーデータを一件取得しインスタンス変数へ渡す
  	@user = User.find(params[:id])
  	# @userに関連づけた投稿(.post_image)のみ@post_imagesに渡すことができます。
  	@post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
  	# ユーザーデータを一件取得しインスタンス変数へ渡す。
  	@user = User.find(params[:id])
  end

  def update
  	# 変更結果を保存できるようにする
  	# ユーザーデータを一件取得しインスタンス変数へ渡す。
  	@user = User.find(params[:id])
  	# 編集したものをセーブする
  	@user.update(user_params)
  	# user_pathへリダイレクトする
  	redirect_to user_path(@user.id)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
