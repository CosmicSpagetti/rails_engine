require 'rails_helper'

describe "Customers API" do 
  it "sends a list of customers" do 
    create_list(:customer, 3)

    get "/api/v1/customers"

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers["data"].count).to eq(3)
  end 

  it "can get one customer by its id" do
    id = create(:customer).id.to_s

    get "/api/v1/customers/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(id)
  end
end