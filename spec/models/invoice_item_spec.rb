require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :quantity}
    it { should validate_presence_of :unit_price}
  end 

  describe "Relationships" do 
    it { should belong_to :invoice}
    it { should belong_to :item}
  end 

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      invoice_item_1 = create(:invoice_item, quantity: 500)
      invoice_item_2 = create(:invoice_item, quantity: 500) 
      invoice_item_3 = create(:invoice_item, quantity: 500)
      invoice_item_4 = create(:invoice_item, quantity: 300) 
      
      expect(InvoiceItem.find_all_by_parameters({quantity: "#{invoice_item_1.quantity}"}).count).to eq(3)
    end
  end
end
