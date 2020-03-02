class FavoritesController < ApplicationController

	def create
            post_image = PostImage.find(params[:post_image_id])
            favorite = current_user.favorites.new(post_image_id: post_image.id)
            favorite.save
           # 記事に「いいね」を付けて保存された後は、/post_images/へリダイレクトされる
            redirect_to post_image_path(post_image)
        end
        def destroy
            post_image = PostImage.find(params[:post_image_id])
            favorite = current_user.favorites.find_by(post_image_id: post_image.id)
            favorite.destroy
            # 、/post_images/へリダイレクトされる
            redirect_to post_image_path(post_image)
        end
end
