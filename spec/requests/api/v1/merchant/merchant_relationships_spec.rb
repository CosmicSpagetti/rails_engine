require 'rails_helper'

describe "Merchant relationship" do 
  it "Should show specified merchants items" do 
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    item_1 = create(:item, merchant: merchant_1)
    item_2 = create(:item, merchant: merchant_1)
    item_3 = create(:item, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    merchant_items = JSON.parse(response.body)
    expect(response).to be_successful
    expect(merchant_items["data"].count).to eq(2)
    expect(merchant_items["data"].first["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(merchant_items["data"].second["attributes"]["merchant_id"]).to eq(merchant_1.id)
  end

  it "Should show specified merchants invoices" do 
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    invoice_1 = create(:invoice, merchant: merchant_1)
    invoice_2 = create(:invoice, merchant: merchant_1)
    invoice_3 = create(:invoice, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/invoices"

    merchant_invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_invoices["data"].count).to eq(2)
    expect(merchant_invoices["data"].first["attributes"]["merchant_id"]).to eq(merchant_1.id)
    expect(merchant_invoices["data"].second["attributes"]["merchant_id"]).to eq(merchant_1.id)
  end 
end