class CreatePrivateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.integer "sender_id"
      t.integer "recipient_id"
      t.timestamps
    end
  end
end
