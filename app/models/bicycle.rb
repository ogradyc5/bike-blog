class Bicycle < ActiveRecord::Base
  belongs_to :user
  has_many :bicycle_categories
  has_many :categories, through: :bicycle_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, presence: true, length: { minimum: 10, maximum: 800 }
  validates :price, presence: true
  validates_presence_of :price, :message => "must be a positive number"
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :user_id, presence: true #ensures userid per bike
end
