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

  it "can find single merchant based on parameter" do 
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    

    get "/api/v1/merchants/find?id=#{merchant_1.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(merchant_1.id.to_s)
    expect(merchant["data"]["id"]).to_not eq(merchant_2.id.to_s)
  end

  it "can find all merchants based on parameter" do 
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant) 
    merchant_3 = create(:merchant)
    merchant_4 = create(:merchant, name: "billy")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

    merchants = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(merchants["data"].count).to eq(3)
  end
end 