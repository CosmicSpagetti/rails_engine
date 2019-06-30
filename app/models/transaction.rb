class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :result
  scope :order_by_id, -> { order(id: 'asc')}
  scope :successful, -> { where(result: 'success') }

  def self.find_all_by_parameters(params)
    where(params).order(:id)
  end
end
 
