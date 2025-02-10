class CreateMessage < ApplicationRecord
  def change
    create_table :private_messages do |t|
      t.references :recipient, index: true
      t.references :sender, index: true
  end
  end
end     