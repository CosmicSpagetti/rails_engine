class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :item_id, :invoice_id, :quantity
  belongs_to :item
  belongs_to :invoice

  attribute :unit_price do |num_object| 
    (num_object.unit_price.to_f/100).to_s
  end
end
