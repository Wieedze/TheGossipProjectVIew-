class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip

  validates :user, presence: true
  validates :gossip, presence: true
end
