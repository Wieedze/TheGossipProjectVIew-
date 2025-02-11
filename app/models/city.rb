class City < ApplicationRecord
  has_many :users
  validates :user, presence: true
  validates :city, presence: true
end
