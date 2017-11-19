class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :title
      t.text :description
      t.float :price

      t.timestamps null: false
    end
  end
end
