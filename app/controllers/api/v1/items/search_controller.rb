class Api::V1::Items::SearchController < ApplicationController
  def index 
    render json: ItemSerializer.new(Item.find_all_by_parameters(search_params))
  end
  
  def show
    render json: ItemSerializer.new(Item.order_by_id.find_by(search_params))
  end

  private 

  def search_params 
    new_params = params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    unless new_params[:unit_price].nil?
      new_params[:unit_price] = (new_params[:unit_price].to_f * 100).round(2) if new_params[:unit_price].include?(".")
    end
    new_params
  end
end