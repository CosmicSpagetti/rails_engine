class Merchant < ApplicationRecord
  has_many :items 
  has_many :invoices
  has_many :customers, through: :invoices
  validates_presence_of :name

  def self.best_merchants(limit)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(items: [invoices: [:transactions]])
    .group(:id)
    .reorder("revenue DESC")
    .merge(Transaction.successful)
    .limit(limit)
  end

  def self.find_all_by_parameters(params)
    where(params)
  end

  def self.merchants_by_most_items(limit)
    select("merchants.*, sum(invoice_items.quantity) as items_sold")
    .joins(items: [invoices: [:transactions]])
    .group(:id)
    .reorder("items_sold DESC")
    .merge(Transaction.successful)
    .limit(limit)
  end

  def revenue_by_merchant
    invoices
      .joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
      .take
  end

  def revenue_by_merchant_by_date(date)
    invoices
    .joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .where('CAST(invoices.updated_at AS text) LIKE ?', "#{date}%")
    .take
  end
end
