class User < ApplicationRecord
  has_many :images, dependent: :destroy
  default_scope { order(created_at: :desc) }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  acts_as_followable
  acts_as_follower
end
