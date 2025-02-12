class AddCityIdToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :city, null: false, foreign_key: true
  end
end
