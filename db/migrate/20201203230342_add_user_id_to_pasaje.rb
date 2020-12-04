class AddUserIdToPasaje < ActiveRecord::Migration[6.0]
  def change
    add_reference :pasajes, :user, index: true
    add_foreign_key :pasajes, :users
  end
end
