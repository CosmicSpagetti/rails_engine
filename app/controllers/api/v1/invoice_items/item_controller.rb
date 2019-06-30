class Api::V1::InvoiceItems::ItemController < ApplicationController
  def index 
    invoice_item = InvoiceItem.find(params[:invoice_item_id])
    render json: ItemSerializer.new(invoice_item.item)
  end
end