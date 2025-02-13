class AddForeignKeysToComments < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :comments, :users
    add_foreign_key :comments, :gossips
  end
end
