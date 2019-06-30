class CustomerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :first_name, :last_name
  has_many :invoices
  has_many :merchants, through: :invoices 
  has_many :transactions, through: :invoices
end
