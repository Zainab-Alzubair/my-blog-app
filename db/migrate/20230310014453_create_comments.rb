class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      
      t.timestamps
    end
  end
  def down 
    drop_table :comments
  end
end
