FactoryBot.define do
  factory :customer do
    sequence(:first_name) {|n| "Billy" }
    sequence(:last_name) {|n| "Some last name #{n}" }
  end
end
