class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :title
      t.text :decription
      t.float :price

      t.timestamps null: false
    end
  end
end
