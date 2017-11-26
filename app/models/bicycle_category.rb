class BicycleCategory < ActiveRecord::Base
  belongs_to :bicycle
  belongs_to :category
end 