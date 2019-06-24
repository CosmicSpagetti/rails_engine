class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  has_many :transactions

  validates_presence_of :quantity, :unit_price
end
