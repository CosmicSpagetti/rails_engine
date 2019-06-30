class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  def index 
    invoice_item = InvoiceItem.find(params[:invoice_item_id])
    render json: InvoiceSerializer.new(invoice_item.invoice)
  end
end 