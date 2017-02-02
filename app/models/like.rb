class Like < ApplicationRecord
  belongs_to :user
  belongs_to :image

  delegate :name, to: :user, prefix: true
end
