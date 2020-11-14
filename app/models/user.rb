class User < ApplicationRecord
  validates :username, :fullname, presence: true
  validates :username, uniqueness: true
  # rubocop:disable Metrics/LineLength
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  has_attached_file :coverimage, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :coverimage, content_type: %r{\Aimage/.*\z}
  has_many :hints, dependent: :destroy
  has_many :active_relationships, class_name: 'Follower', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Follower', foreign_key: 'followed_id', dependent: :destroy
  # rubocop:enable Metrics/LineLength
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def show_hints
    hints.all
  end
end
