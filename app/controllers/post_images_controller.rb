class PostImagesController < ApplicationController

	def new
		@post_image = PostImage.new
	end

# 投稿データの保存
	def create
		@post_image = PostImage.new(post_image_params)
		@post_image.user_id = current_user.id
		if @post_image.save
			redirect_to post_images_path
		else
			render :new
		end
	end

	def index
		# indexアクション内の全てのデータを取得
		# @post_images = PostImage.all
		# 決められた数のデータだけを新しい順に取得（kaminariをインストールしたのでpageが使用可能)
		@post_images = PostImage.page(params[:page]).reverse_order

	end

	def show
	# 詳細画面が表紙されるように設定
		@post_image = PostImage.find(params[:id])
	# コメントのインスタンス変数を設定
		@post_comment = PostComment.new
	end

	# 投稿データのストロングパラメーター
private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
