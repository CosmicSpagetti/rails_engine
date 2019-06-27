class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions

  validates_presence_of :status
  default_scope -> { order(id: :asc ) }
end
