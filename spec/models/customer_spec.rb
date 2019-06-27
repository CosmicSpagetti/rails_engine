require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "Validations" do 
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name }
  end 

  describe "Relationships" do 
    it { should have_many :invoices}
  end

  describe "class methods" do 
    it ".find_all_by_parameters" do 
      customer_1 = create(:customer)
      customer_2 = create(:customer) 
      customer_3 = create(:customer)
      customer_4 = create(:customer, first_name: "Billy 2")

      expect(Customer.find_all_by_parameters({first_name: "#{customer_1.first_name}"}).count).to eq(3)
    end
  end
end
