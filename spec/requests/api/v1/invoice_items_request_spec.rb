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
end 