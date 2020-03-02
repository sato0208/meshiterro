class PostImage < ApplicationRecord


	attachment :image
	belongs_to :user
	has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
# imageとshop_nameにデータが入力されてなければsaveメソッドでfalseが返される
    validates :shop_name, presence:true
    validates :image, presence: true

# このメソッドで、引数で渡されたユーザIDがFavaritesテーブル内に存在するか調べる
	 def favorited_by?(user)
	      favorites.where(user_id: user.id).exists?
	 end
end
