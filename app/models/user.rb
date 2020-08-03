class User < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_attached_file :coverimage, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :coverimage, content_type: /\Aimage\/.*\z/

  has_many :hints, dependent: :destroy
  has_many :active_relationships, class_name: "Follower", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: 'Follower', foreign_key: 'followed_id', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  def show_hints
		hints.all
	end

  def following
    active_relationships.all
  end

  def followerr
    passive_relationships.all
  end

end
