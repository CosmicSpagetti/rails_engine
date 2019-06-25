require 'rails_helper'

describe "Merchant API" do 
  it "sends a list of Merchants" do 
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end 
end 