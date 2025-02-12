class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :tags
  has_many :comment
  has_many :likes


  validates :title, presence: true, length: {
    minimum: 3, maximum: 30,
    message: "Le titre doit faire entre 3 et 14 caractères"
  }
  validates :content, presence: true, length: {
    minimum: 10, maximum: 150,
    message: "Le potin doit faire entre 10 et 150 caractères"
  }
end
