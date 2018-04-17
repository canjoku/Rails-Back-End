class AddValidationToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :username, :string, null: false
    change_column :users, :email, :string, null: false
  end
end
