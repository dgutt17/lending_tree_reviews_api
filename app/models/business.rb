class Business < ActiveRecord::Base
  validates_presence_of :name, :lending_tree_id, :brand_id

  def self.human_attribute_name(attr, options = {})
    return 'Business BrandId' if attr == :brand_id  || attr == 'brand_id'
    return 'Business Name' if attr == :name || attr == 'name'
    return 'Business LendingTreeId' if attr == :lending_tree_id || attr == 'lending_tree_id'

    super
  end
end