class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tags
  has_many :comment
  has_many :likes
end
