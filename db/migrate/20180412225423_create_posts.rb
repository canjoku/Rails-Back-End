class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :category_id
      t.integer :user_id
      t.string :image
      t.text :description
      t.text :body

      t.timestamps
    end
  end
end
