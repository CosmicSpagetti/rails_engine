class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    merchant = Merchant.find(params[:merchant_id])
    render json: InvoiceSerializer.new(merchant.invoices)
  end
end