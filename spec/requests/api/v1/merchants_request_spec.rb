require 'rails_helper'

describe "Merchant API" do 
  it "sends a list of Merchants" do 
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end 

  it "can get one item by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants["id"]).to eq(id)
  end
end 