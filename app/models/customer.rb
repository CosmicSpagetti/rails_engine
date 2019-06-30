class Customer < ApplicationRecord
  has_many :invoices
  has_many :merchants, through: :invoices 
  has_many :transactions, through: :invoices
  validates_presence_of :first_name, :last_name

  def self.find_all_by_parameters(params)
    where(params)
  end
end
