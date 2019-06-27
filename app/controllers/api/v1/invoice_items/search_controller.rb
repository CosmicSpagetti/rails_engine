class Api::V1::InvoiceItems::SearchController < ApplicationController
  def index 
    render json: InvoiceItemSerializer.new(InvoiceItem.find_all_by_parameters(search_params))
  end
  
  def show
    render json: InvoiceItemSerializer.new(InvoiceItem.find_by(search_params))
  end

  private 

  def search_params 
    new_params = params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
    if !new_params[:unit_price].nil?
      new_params[:unit_price] = new_params[:unit_price].to_f * 100  
    end
    new_params
  end
end