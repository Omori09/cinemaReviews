class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.text :about
      t.string :user_name
      t.string :image
      t.integer :seat
      t.string :title
      t.integer :volume
      t.integer :clean
      t.integer :shop
      t.integer :user_id

      t.timestamps
    end
  end
end
