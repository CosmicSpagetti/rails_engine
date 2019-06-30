require 'rails_helper'

describe "Transaction relationship" do 
  it "Should show specified transaction's invoice" do 
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    transaction_invoice = JSON.parse(response.body)["data"]

    expect(transaction_invoice["id"]).to eq(invoice.id.to_s)
  end
end