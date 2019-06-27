require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :status}
  end 

  describe "Relationships" do 
    it { should belong_to :customer}
    it { should belong_to :merchant}
    it { should have_many :transactions}
  end

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice) 
      invoice_3 = create(:invoice)
      invoice_4 = create(:invoice, status: "FAILED")
      
      expect(Invoice.find_all_by_parameters({status: "#{invoice_1.status}"}).count).to eq(3)
    end
  end
end

