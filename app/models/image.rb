class Image < ApplicationRecord
  belongs_to :user
  acts_as_votable

  delegate :name, to: :user, prefix: true

  scope :popular, ->() {
    where('created_at >= ?', 1.hour.ago)
      .order('cached_votes_total DESC, created_at DESC')
  }

  def owner
    user_name
  end

  def user_follows_count
    user.followers.count
  end

  def likes_count
    votes_for.size
  end
end
