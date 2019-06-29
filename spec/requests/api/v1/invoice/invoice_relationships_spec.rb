require 'rails_helper'

describe "Invoice relationships" do 
  it "Should show specified invoices transactions" do 
    invoice = create(:invoice)
    transaction_1 = create(:transaction, invoice: invoice)
    transaction_2 = create(:transaction, invoice: invoice)
    transaction_3 = create(:transaction)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    invoice_transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_transactions["data"].count).to eq(2)
    expect(invoice_transactions["data"].first["attributes"]["invoice_id"]).to eq(invoice.id)
    expect(invoice_transactions["data"].second["attributes"]["invoice_id"]).to eq(invoice.id)
  end

  it "Should show specified invoices items" do 
    invoice = create(:invoice)
    item_1 = create(:item, invoice: invoice)
    item_2 = create(:item, invoice: invoice)
    item_3 = create(:item)

    get "/api/v1/invoices/#{invoice_id}/items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"].count).to eq(2)
    expect(invoice_items["data"].first["attributes"]["invoice_id"]).to eq(invoice.id)
    expect(invoice_items["data"].second["attributes"]["invoice_id"]).to eq(invoice.id)
  end

end