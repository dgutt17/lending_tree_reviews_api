class Business < ActiveRecord::Base
  validates_presence_of :name, :brand_id
end