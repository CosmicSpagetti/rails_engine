require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :name}
  end 

  describe "Relationships" do 
    it { should have_many :items}
  end

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant) 
      merchant_3 = create(:merchant)
      merchant_4 = create(:merchant, name: "billy")
      
      expect(Merchant.find_all_by_parameters({name: "#{merchant_1.name}"}).count).to eq(3)
    end
  end
end
