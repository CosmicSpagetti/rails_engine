require 'rails_helper'

describe "Business intel for Merchant" do
  before :each do 
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

    @invoice_item_1 = create(:invoice_item,quantity: 1, item: @item_1, unit_price: 10.0, invoice: @invoice_1)
    @invoice_item_2 = create(:invoice_item, quantity: 2, item: @item_2, unit_price: 200.0, invoice: @invoice_2)
    @invoice_item_3 = create(:invoice_item, quantity: 3, item: @item_3, unit_price: 300.0, invoice: @invoice_3)
    @invoice_item_4 = create(:invoice_item, quantity: 4, item: @item_4, unit_price: 400.0, invoice: @invoice_4)
    @invoice_item_5 = create(:invoice_item, quantity: 5, item: @item_5, unit_price: 500.0, invoice: @invoice_5)
    @invoice_item_6 = create(:invoice_item, quantity: 6, item: @item_6, unit_price: 1000.0, invoice: @invoice_6)
    @invoice_item_7 = create(:invoice_item, quantity: 7, item: @item_6, unit_price: 1000.0, invoice: @invoice_7)
  end 

  it "Can return variable merchants ranked by total revenue" do 

    get "/api/v1/merchants/most_revenue?quantity=3"

    best_merchants = JSON.parse(response.body)

    expect(response).to be_successful    

    expect(best_merchants['data'].length).to eq(3)
    expect(best_merchants['data'].first['attributes']['id']).to eq(@merchant_6.id)
    expect(best_merchants['data'].last['attributes']['id']).to eq(@merchant_4.id)
  end
  
  it "Should return variable merchants ranked by total items sold" do 
    get "/api/v1/merchants/most_items?quantity=3" 

    best_merchants = JSON.parse(response.body)

    expect(response).to be_successful    

    expect(best_merchants['data'].length).to eq(3)
    expect(best_merchants['data'].first['attributes']['id']).to eq(@merchant_6.id)
    expect(best_merchants['data'].last['attributes']['id']).to eq(@merchant_4.id)
  end

  it "should return total revenue for all merchants for a data given" do
    get "/api/v1/merchants/revenue?date=2012-03-07"

    total_revenue = JSON.parse(response.body)

    expect(response).to be_successful    

    expect(total_revenue["data"]["attributes"]["total_revenue"]).to eq('41.0')
  end

  it "should return total revenue for a specified merchant" do 
    get "/api/v1/merchants/#{@merchant_6.id}/revenue"

    total_revenue = JSON.parse(response.body)


    expect(response).to be_successful    

    expect(total_revenue["data"]["attributes"]["revenue"]).to eq('60.0')
  end

  it "should return total revenue for a specified merchant on a specified date" do 
    get "/api/v1/merchants/#{@merchant_6.id}/revenue?date=2012-03-07"

    total_revenue = JSON.parse(response.body)


    expect(response).to be_successful    

    expect(total_revenue["data"]["attributes"]["revenue"]).to eq('0.0')
  end

  it "should return favorite customer of specified merchant" do 
    get "/api/v1/merchants/#{@merchant_6.id}/favorite_customer"

    favorite_customer = JSON.parse(response.body)


    expect(response).to be_successful    

    expect(favorite_customer["data"]["id"]).to eq(@customer.id)

  end
end