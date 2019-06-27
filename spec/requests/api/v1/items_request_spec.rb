require 'rails_helper'

describe "Items API" do 
  it "sends a list of items" do 
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)
  end 
  
  it "can get one item by its id" do
    id = create(:item).id.to_s

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(id)
  end

  it "can find single item based on parameter" do 
    item_1 = create(:item)
    item_2 = create(:item) 
    item_3 = create(:item)
    item_4 = create(:item, name: "item 1")
    

    get "/api/v1/items/find?id=#{item_1.id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(item_1.id.to_s)
    expect(item["data"]["id"]).to_not eq(item_2.id.to_s)
  end

  it "can find all items based on parameter" do 
    item_1 = create(:item)
    item_2 = create(:item)
    item_3 = create(:item)
    item_4 = create(:item, name: "item 1")   
  
    get "/api/v1/items/find_all?name=#{item_1.name}"

    items = JSON.parse(response.body) 
    
    expect(response).to be_successful
    expect(items["data"].count).to eq(3)
  end
end 