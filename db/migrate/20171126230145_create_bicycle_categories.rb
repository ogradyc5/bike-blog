class CreateBicycleCategories < ActiveRecord::Migration
  def change
    create_table :bicycle_categories do |t|
      t.integer :bicycle_id
      t.integer :category_id
    end
  end
end
