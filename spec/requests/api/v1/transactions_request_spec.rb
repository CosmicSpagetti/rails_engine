require 'rails_helper'

describe "Transactions API" do 
  it "sends a list of transactions" do 
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
  
    expect(transactions["data"].count).to eq(3)
  end 

  it "can get one transaction by its id" do
    id = create(:transaction).id.to_s

    get "/api/v1/transactions/#{id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"]["id"]).to eq(id)
  end
end 