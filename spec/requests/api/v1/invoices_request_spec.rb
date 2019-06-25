require 'rails_helper'

describe "Invoices API" do 
  it "sends a list of invoices" do 
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices["data"].count).to eq(3)
  end 

  it "can get one invoice by its id" do
    id = create(:invoice).id.to_s

    get "/api/v1/invoices/#{id}"

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices["data"]["id"]).to eq(id)
  end
end 