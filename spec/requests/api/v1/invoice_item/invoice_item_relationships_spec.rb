require 'rails_helper'

describe "Invoice_items relationships" do 
  it "should show items from specified invoice_item id" do
    item = create(:item)
    invoice_item = create(:invoice_item, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    invoice_item_item = JSON.parse(response.body)["data"]

    expect(response).to be_successful
    expect(invoice_item_item["id"]).to eq(item.id.to_s)
  end
end