class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :likes
  validates :user, presence: true
  validates :content, presence: true
  validates_length_of :content, minimum: 5, maximum: 100, message: "Votre commentaire doit etre comrpis entre 5 et 100 lettre"
end
