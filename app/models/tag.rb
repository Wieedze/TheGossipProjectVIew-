class Tag < ApplicationRecord
  has_many :gossip, optional: true
  validates :title, presence: true
  validates :title, uniqueness: true
end
