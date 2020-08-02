class User < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :coverimage, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :coverimage, content_type: /\Aimage\/.*\z/

  has_many :hints
  has_many :followers
  has_many :following, class_name: 'Followers', foreign_key: 'follower_id'
  	def show_hints
		hints.all
	end
end
