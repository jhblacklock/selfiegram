class Image < ApplicationRecord
  belongs_to :user
  has_many :followers
  delegate :name, to: :user, prefix: true
  has_many :likes

  scope :popular, ->() {
    where('created_at >= ?', 1.hour.ago)
      .order('likes_count DESC, created_at DESC')
  }

  def owner
    user_name
  end

  def user_follows_count
    user.followers.count
  end

  # def likes_count
  #   votes_for.size
  # end
end


# images = Image.select("*, count(votes_fors.id) AS likes_count").joins('votes_fors').group("votes_fors.id").order("likes_count DESC")