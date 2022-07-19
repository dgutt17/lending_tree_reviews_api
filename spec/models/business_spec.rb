require 'spec_helper'

RSpec.describe Business, type: :model do
  context "Validations" do
    let(:business) {Business.new(name: 'Test1', brand_id: 123456, lending_tree_id: 5788685)}

    it "is valid when it has a name and a brand_id" do
      expect(business).to be_valid
    end

    it "is not valid when there is no name" do
      business.name = nil
      expect(business).not_to be_valid
    end

    it "is not valid when there is no brand_id" do
      business.brand_id = nil
      expect(business).not_to be_valid
    end

    it "is not valid when there is no lending_tree_id" do
      business.lending_tree_id = nil
      expect(business).not_to be_valid
    end
  end
end