class Product < ActiveRecord::Base

  attr_accessible :name
  attr_accessible :price
  attr_accessible :product_type

  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :product_type

  validates :price, :numericality => true

end
