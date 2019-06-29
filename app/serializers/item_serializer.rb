class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id
  belongs_to :merchant

  attribute :unit_price do |num_object| 
    (num_object.unit_price.to_f/100).to_s
  end
end
