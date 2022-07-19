class CreateBusiness < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.integer :lending_tree_id, null: false
      t.integer :brand_id, null: false
       
      t.timestamps
    end

    add_index :businesses, :lending_tree_id
  end
end
