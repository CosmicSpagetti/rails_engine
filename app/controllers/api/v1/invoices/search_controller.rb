class Api::V1::Invoices::SearchController < ApplicationController
  def index 
    render json: InvoiceSerializer.new(Invoice.find_all_by_parameters(search_params))
  end
  
  def show
    render json: InvoiceSerializer.new(Invoice.find_by(search_params))
  end

  private 

  def search_params 
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end