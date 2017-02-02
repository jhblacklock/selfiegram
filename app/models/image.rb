class Image < ApplicationRecord
  belongs_to :user
  has_many :followers
  delegate :name, to: :user, prefix: true
  has_many :likes

  scope :popular, ->() {
    where('created_at >= ?', 1.hour.ago)
      .select('*, count(likes.id) AS likes_count').joins('likes')
      .group('likes.id')
      .order('likes_count DESC, created_at DESC')
  }

  def owner
    user_name
  end

  def user_follows_count
    user.followers.count
  end
end
