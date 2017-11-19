class AddDescriptionToBicycles < ActiveRecord::Migration
  def change
    
    add_column :bicycles, :created_at, :datetime
    add_column :bicycles, :updated_at, :datetime
    
  end
end
