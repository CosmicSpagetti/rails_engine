require 'rails_helper'

describe "Invoice Items API" do 
  it "sends a list of invoice items" do 
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body) 

    expect(invoice_items["data"].count).to eq(3)
  end 

  it "can get one invoice item by its id" do
    id = create(:invoice_item).id.to_s

    get "/api/v1/invoice_items/#{id}"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"]["id"]).to eq(id)
  end
 
  it "can find single invoice_item based on parameter" do 
    invoice_item_1 = create(:invoice_item, quantity: 500)
    invoice_item_2 = create(:invoice_item, quantity: 500) 
    

    get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["id"]).to eq(invoice_item_1.id.to_s)
    expect(invoice_item["data"]["id"]).to_not eq(invoice_item_2.id.to_s)
  end

  it "can find all invoice_items based on parameter" do 
    invoice_item_1 = create(:invoice_item, quantity: 500)
    invoice_item_2 = create(:invoice_item, quantity: 500) 
    invoice_item_3 = create(:invoice_item, quantity: 500)
    invoice_item_4 = create(:invoice_item, quantity: 300) 

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item_1.quantity}"

    invoice_items = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(invoice_items["data"].count).to eq(3)
  end
end 