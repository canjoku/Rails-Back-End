class AddValidationToPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :title, :string, null: false
    change_column :posts, :description, :string, null: false
    change_column :posts, :body, :text, null: false
    change_column :posts, :user_id, :integer, null: false
  end
end
