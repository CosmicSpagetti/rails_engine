require 'rails_helper'

describe "Items relationships" do 
  it "display invoice_items based on item id" do 
    item = create(:item)

    invoice_item_1 = create(:invoice_item, item: item)
    invoice_item_2 = create(:invoice_item, item: item)
    invoice_item_3 = create(:invoice_item)

    get "/api/v1/items/#{item.id}/invoice_items"

    item_invoice_items = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(item_invoice_items.count).to eq(2)
    expect(item_invoice_items.first["id"].to_i).to eq(invoice_item_1.id)
    expect(item_invoice_items.second["id"].to_i).to eq(invoice_item_2.id)
  end

  it "display merchants based on item id" do 
    merchant = create(:merchant)

    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

   
    get "/api/v1/items/#{item_1.id}/merchant"

    item_merchant = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(item_merchant["id"]).to eq(merchant.id.to_s)
  end
end