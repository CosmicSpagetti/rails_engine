require 'rails_helper'

describe "Merchant API" do 
  it "sends a list of Merchants" do 
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants["data"].count).to eq(3)
  end 

  it "can get one merchant by its id" do
    id = create(:merchant).id.to_s

    get "/api/v1/merchants/#{id}"

    merchants = JSON.parse(response.body)
   
    expect(response).to be_successful
    expect(merchants["data"]["id"]).to eq(id)
  end
end 