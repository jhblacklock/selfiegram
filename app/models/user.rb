class User < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :follows
  has_many :following_users, through: :follows, source: :user
  has_many :follower_users, class_name: 'Follow', foreign_key: 'follower_id'
  has_many :followers, through: :follower_users, source: :user

  default_scope { order(created_at: :desc) }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def follow(user)
    follows?(user) || follows.create(follower_id: user.id)
  end

  def follows?(user)
    follows.find_by(follower_id: user.id)
  end

  def likes?(image)
    image.likes.where(image_id: image).present?
  end

  def like(image)
    image.likes.find_or_create_by(image_id: image, user_id: id)
  end

  def unlike(image)
    image.likes.where(image_id: image)
  end

  def liked_by?(user)
    image.likes.where(user_id: user).present?
  end
end
