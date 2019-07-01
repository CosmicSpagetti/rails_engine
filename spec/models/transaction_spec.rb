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

    it ".revenue_by_date" do 
      @merchant_1 = create(:merchant, name: "Billy")
      @merchant_2 = create(:merchant, name: "Billy2")
      @merchant_3 = create(:merchant, name: "Billy3")
      @merchant_4 = create(:merchant, name: "Billy4")
      @merchant_5 = create(:merchant, name: "Billy5")
      @merchant_6 = create(:merchant, name: "Billy6")

      @item_1 = create(:item, merchant: @merchant_1)
      @item_2 = create(:item, merchant: @merchant_2)
      @item_3 = create(:item, merchant: @merchant_3)
      @item_4 = create(:item, merchant: @merchant_4)
      @item_5 = create(:item, merchant: @merchant_5)
      @item_6 = create(:item, merchant: @merchant_6)

      @customer = create(:customer)
      
      @invoice_1 = create(:invoice, merchant: @merchant_1)
      @invoice_2 = create(:invoice, merchant: @merchant_2)
      @invoice_3 = create(:invoice, merchant: @merchant_3)
      @invoice_4 = create(:invoice, merchant: @merchant_4, updated_at: "2012-03-07")
      @invoice_5 = create(:invoice, merchant: @merchant_5, updated_at: "2012-03-07")
      @invoice_6 = create(:invoice, merchant: @merchant_6, customer: @customer)
      @invoice_7 = create(:invoice, merchant: @merchant_6, customer: @customer)

      @transaction_1 = create(:transaction, invoice: @invoice_1)
      @transaction_2 = create(:transaction, invoice: @invoice_2)
      @transaction_3 = create(:transaction, invoice: @invoice_3)
      @transaction_4 = create(:transaction, invoice: @invoice_4)
      @transaction_5 = create(:transaction, invoice: @invoice_5)
      @transaction_6 = create(:transaction, invoice: @invoice_6)
      @transaction_7 = create(:transaction, invoice: @invoice_7, result: 'failed')

      @invoice_item_1 = InvoiceItem.create(quantity: 1, item: @item_1, unit_price: 10.0, invoice: @invoice_1)
      @invoice_item_2 = InvoiceItem.create(quantity: 2, item: @item_2, unit_price: 200.0, invoice: @invoice_2)
      @invoice_item_3 = InvoiceItem.create(quantity: 3, item: @item_3, unit_price: 300.0, invoice: @invoice_3)
      @invoice_item_4 = InvoiceItem.create(quantity: 4, item: @item_4, unit_price: 400.0, invoice: @invoice_4)
      @invoice_item_5 = InvoiceItem.create(quantity: 5, item: @item_5, unit_price: 500.0, invoice: @invoice_5)
      @invoice_item_6 = InvoiceItem.create(quantity: 6, item: @item_6, unit_price: 1000.0, invoice: @invoice_6)
      @invoice_item_7 = InvoiceItem.create(quantity: 7, item: @item_6, unit_price: 1000.0, invoice: @invoice_7)

      expect(Transaction.revenue_by_date("2012-03-07").revenue).to eq(4100)
    end
  end

end

