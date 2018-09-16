class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :email, null: false, unique: true
      t.timestamps
    end
  end
end
