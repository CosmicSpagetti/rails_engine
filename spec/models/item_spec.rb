require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :name}
    it { should validate_presence_of :description}
    it { should validate_presence_of :unit_price}
  end 

  describe "Relationships" do 
    it { should belong_to :merchant}
    it { should have_many :invoice_items}
  end

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      item_1 = create(:item)
      item_2 = create(:item) 
      item_3 = create(:item)
      item_4 = create(:item, name: "item 1")
      
      expect(Item.find_all_by_parameters({name: "#{item_1.name}"}).count).to eq(3)
    end
  end
end
