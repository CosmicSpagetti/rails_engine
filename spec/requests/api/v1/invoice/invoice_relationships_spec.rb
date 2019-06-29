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
    merchant = create(:merchant)

    invoice = create(:invoice, merchant: merchant)

    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)

    create(:invoice_item, invoice: invoice, item: item_1)
    create(:invoice_item, invoice: invoice, item: item_2)
    create(:invoice_item, invoice: invoice, item: item_3)

    get "/api/v1/invoices/#{invoice.id}/items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items["data"].count).to eq(3)
    expect(invoice_items["data"].first["type"]).to eq("item")
    expect(invoice_items["data"].first["id"]).to eq(item_1.id.to_s)
    expect(invoice_items["data"].second["id"]).to eq(item_2.id.to_s)
  end

  it "Should show specified invoices invoice_items" do 
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)

    invoice_item_1 = create(:invoice_item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, invoice: invoice_1)
    invoice_item_3 = create(:invoice_item, invoice: invoice_2)

    get "/api/v1/invoices/#{invoice_1.id}/invoice_items"

    invoice_invoice_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful 

    expect(invoice_invoice_items.count).to eq(2)
    expect(invoice_invoice_items.first["type"]).to eq("invoice_item")
    expect(invoice_invoice_items.first["id"]).to eq(invoice_item_1.id.to_s)
    expect(invoice_invoice_items.second["id"]).to eq(invoice_item_2.id.to_s)
  end

  it "should show specified invoices customers" do 
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    
    customer_1 = create(:customer, invoice: invoice_1)
    customer_2 = create(:customer, invoice: invoice_2)
  end

end