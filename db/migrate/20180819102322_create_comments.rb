class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :post, foreign_key: true, null: false
      t.timestamps
    end
  end
end
