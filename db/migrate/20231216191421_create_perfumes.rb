class CreatePerfumes < ActiveRecord::Migration[6.1]
  def change
    create_table :perfumes do |t|
      t.string :question1
      t.string :question2
      
      t.timestamps
    end
  end
end
