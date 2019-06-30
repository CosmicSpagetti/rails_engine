class Merchant < ApplicationRecord
  has_many :items 
  has_many :invoices
  has_many :customers, through: :invoices
  validates_presence_of :name

  def self.best_merchants(limit)
    self.select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(items: [invoices: [:transactions]])
    .group(:id)
    .reorder("revenue DESC")
    .merge(Transaction.successful)
    .limit(limit)
  end

  def self.find_all_by_parameters(params)
    where(params)
  end
end
