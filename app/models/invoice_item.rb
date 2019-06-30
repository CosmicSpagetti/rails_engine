class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  validates_presence_of :quantity, :unit_price

  def self.find_all_by_parameters(params)
    where(params).order(:id)
  end
end
