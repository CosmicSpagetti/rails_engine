require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :credit_card_number}
    it { should validate_presence_of :result}
  end 

  describe "Relationships" do 
    it { should belong_to :invoice}
  end

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      transaction_1 = create(:transaction)
      transaction_2 = create(:transaction) 
      transaction_3 = create(:transaction)
      transaction_4 = create(:transaction, result: "Failed")
      
      expect(Transaction.find_all_by_parameters({result: "#{transaction_1.result}"}).count).to eq(3)
    end
  end
end

