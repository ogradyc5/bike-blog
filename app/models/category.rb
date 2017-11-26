class Category < ActiveRecord::Base
  has_many :bicycle_categories
  has_many :bicycles, through: :bicycle_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end