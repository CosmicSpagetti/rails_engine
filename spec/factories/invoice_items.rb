FactoryBot.define do
  factory :invoice_item do
    items
    invoices
    sequence(:quantity) {|n| "Quantity #{n}" }
    sequence(:unit_price) {|n| "Unit price #{n}" }
  end
end
