class CreateBusiness < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.integer :integer, null: false
    end

    add_index :businesses, :name
  end
end
