class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    invoice = Invoice.find(params[:invoice_id])
    render json: InvoiceItemSerializer.new(invoice.invoice_items)
  end
end