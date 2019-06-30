FactoryBot.define do
  factory :transaction do
    invoice
    credit_card_number { "MyString" }
    credit_card_expiration_date { "MyString" }
    result { "Success" }
  end
end
