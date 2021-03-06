desc "Import Data files to database"

namespace :import_csv do |import_csv_namespace|

  desc "Import customers"
  task import_1_customers: :environment  do 
    CSV.foreach('./public/data/customers.csv', :headers => true) do |row|
      Customer.create!(row.to_h)
    end
    p "Customers imported"
  end
  
  desc "Import merchants"
  task import_2_merchants: :environment  do 
    CSV.foreach('./public/data/merchants.csv', :headers => true) do |row|
      Merchant.create!(row.to_h)
    end
    p "Merchants imported"
  end

  desc "Import items"
  task import_3_items: :environment  do 
    CSV.foreach('./public/data/items.csv', :headers => true) do |row|
      Item.create!(row.to_h)
    end
    p "Items imported"
  end
 
  desc "Import invoices"
  task import_4_invoices: :environment  do 
    CSV.foreach('./public/data/invoices.csv', :headers => true) do |row|
      Invoice.create!(row.to_h)
    end
    p "Invoices imported"
  end

  desc "Import invoice items"
  task import_5_invoice_items: :environment  do 
    CSV.foreach('./public/data/invoice_items.csv', :headers => true) do |row|
      InvoiceItem.create!(row.to_h)
    end
    p "Invoice Items imported"
  end
 
  desc "Import transactions"
  task import_6_transactions: :environment  do 
    CSV.foreach('./public/data/transactions.csv', :headers => true) do |row|
      Transaction.create!(row.to_h)
    end
    p "Transactions imported"
  end

  task :all do
    import_csv_namespace.tasks.each do |task|
      Rake::Task[task].invoke
    end
    p "Imported All"
  end
end 
