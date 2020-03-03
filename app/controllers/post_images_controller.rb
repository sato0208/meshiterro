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

# 　	削除機能の実装
	def destroy
		# resourcesルーティングのdestroyで渡ってきたパラメーターを元に、
		# findメソッドで削除データを探し@post_imageインスタンスに渡しています
		@postimage = PostImage.find(params[:id])
		# @post_imageインスタンスで渡されたデータをdestroyメソッドで削除しています
		@postimage.destroy
		redirect_to post_images_path
	end

	# 投稿データのストロングパラメーター
private
    def post_image_params
        params.require(:post_image).permit(:shop_name, :image, :caption)
    end
end
