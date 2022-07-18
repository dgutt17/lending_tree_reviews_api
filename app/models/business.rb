class Business < ActiveRecord::Base
  validates_presence_of :name, :brand_id

  def self.human_attribute_name(attr, options = {})
    return 'Business Brand Id' if attr == :brand_id  || attr == 'brand_id'
    return 'Business Name' if attr == :name || attr == 'name'

    super
  end
end