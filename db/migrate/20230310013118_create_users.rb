class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :postsCounter, default: 0
      
      t.timestamps
    end
  end
  def down 
    drop_table :users
  end
end
  