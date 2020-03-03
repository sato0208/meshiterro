class UsersController < ApplicationController
  def show
  	# ユーザーデータを一件取得しインスタンス変数へ渡す
  	@user = User.find(params[:id])
  end
end
