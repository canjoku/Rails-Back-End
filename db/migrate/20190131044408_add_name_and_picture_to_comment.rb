class AddNameAndPictureToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :name, :string, null: false
    add_column :comments, :picture, :string
  end
end
