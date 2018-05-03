class AddValidationToUsersPassword < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :password_digest, :string, nill: true
  end
end
