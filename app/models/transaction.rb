class Transaction < ApplicationRecord
  belongs_to :invoice

  validates_presence_of :credit_card_number, :result
  
  scope :successful, -> { where(result: 'success') }

  def self.find_all_by_parameters(params)
    where(params).order(:id)
  end
  
  def self.revenue_by_date(date)
    select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
    .joins(invoice: :invoice_items)
    .merge(Transaction.successful)
    .where('CAST(invoices.updated_at AS text) LIKE ?', "#{date}%")
    .take
  end
end
 
