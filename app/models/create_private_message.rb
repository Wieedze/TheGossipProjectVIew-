class CreateMessage < ApplicationRecord
  def change
    create_table :private_messages do |t|
      t.references :recipient, index: true
      t.references :sender, index: true
    validates :user, presence: true
    validates :recipient, presence: true
    validates :sender, presence: true
    validates :content, presence: true, minimum: 1, message: "Votre message ne peut pas etre vide"
  end
  end
end
