FactoryBot.define do
  factory :invoice_item do
    items
    invoices
    quantity { 1 }
    unit_price { 1 }
  end
end
