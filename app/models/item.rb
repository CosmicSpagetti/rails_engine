class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name, :description, :unit_price 

  def self.find_all_by_parameters(params)
    where(params).order(:id)
  end
end
