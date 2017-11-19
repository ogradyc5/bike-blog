class CreateBicycles < ActiveRecord::Migration
  def change
    create_table :bicycles do |t|
      t.string :title
      t.text :description
      t.float :price
    end
  end
end
