FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    sequence(:quantity) {|n| "Quantity #{n +1 }" }
    sequence(:unit_price) {|n| "Unit price #{n + 1}" }
  end
end
