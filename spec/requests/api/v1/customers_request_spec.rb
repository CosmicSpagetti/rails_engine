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
  
  it "can find single customer based on parameter" do 
    customer_1 = create(:customer)
    customer_2 = create(:customer) 

    get "/api/v1/customers/find?id=#{customer_1.id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["id"]).to eq(customer_1.id.to_s)
    expect(customer["data"]["id"]).to_not eq(customer_2.id.to_s)
  end

  it "can find all customers based on parameter" do 
    customer_1 = create(:customer)
    customer_2 = create(:customer) 
    customer_3 = create(:customer)
    customer_4 = create(:customer, first_name: "Billy 2")

    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name}" 

    customers = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(customers["data"].count).to eq(3)
  end
end