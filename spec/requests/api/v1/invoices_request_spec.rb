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

  it "can find single invoice based on parameter" do 
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice) 
    invoice_3 = create(:invoice)
    invoice_4 = create(:invoice, status: "FAILED")
    

    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"]["id"]).to eq(invoice_1.id.to_s)
    expect(invoice["data"]["id"]).to_not eq(invoice_2.id.to_s)
  end

  it "can find all invoices based on parameter" do 
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice) 
    invoice_3 = create(:invoice)
    invoice_4 = create(:invoice, status: "FAILED")

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    invoices = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(invoices["data"].count).to eq(3)
  end
end 