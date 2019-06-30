require 'rails_helper'

describe "Customer Relationship" do 
  it "Should display specified customer invoices" do 
    customer = create(:customer)

    invoice_1 = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer)

    get "/api/v1/customers/#{customer.id}/invoices" 

    customer = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(customer.first["id"]).to eq(invoice_1.id.to_s)
    expect(customer.second["id"]).to eq(invoice_2.id.to_s)
  end

  it "Should display specified customer transactions" do 
    customer = create(:customer)

    invoice_1 = create(:invoice, customer: customer)
    invoice_2 = create(:invoice, customer: customer)

    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_2)

    get "/api/v1/customers/#{customer.id}/transactions"

    customer_transactions = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(customer_transactions.first["id"].to_i).to eq(transaction_1.id)
    expect(customer_transactions.second["id"].to_i).to eq(transaction_2.id)
  end
end