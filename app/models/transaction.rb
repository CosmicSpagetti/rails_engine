class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :result

  scope :successful, -> { where(result: 'success') }

  def self.find_all_by_parameters(params)
    where(params).order(:id)
  end
end
 
