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

  it "can find single transaction based on parameter" do 
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction) 
    

    get "/api/v1/transactions/find?id=#{transaction_1.id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["id"]).to eq(transaction_1.id.to_s)
    expect(transaction["data"]["id"]).to_not eq(transaction_2.id.to_s)
  end

  it "can find all transactions based on parameter" do 
    transaction_1 = create(:transaction)
    transaction_2 = create(:transaction) 
    transaction_3 = create(:transaction)
    transaction_4 = create(:transaction, result: "Failed")

    get "/api/v1/transactions/find_all?result=#{transaction_1.result}"

    transactions = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(transactions["data"].count).to eq(3)
  end
end 