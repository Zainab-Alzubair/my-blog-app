class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :postId
      
      t.timestamps
    end
  end
  def down 
    drop_table :likes
  end
end
