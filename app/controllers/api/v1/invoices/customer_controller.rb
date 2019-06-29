class Api::V1::Invoices::CustomerController < ApplicationController 
  def index 
    invoice = Invoice.find(params[:invoice_id])
    render json: CustomerSerializer.new(invoice.customer)
  end
end