class AddNillToUserPassword < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :password_digest, :string, allow_nil: true
  end
end
