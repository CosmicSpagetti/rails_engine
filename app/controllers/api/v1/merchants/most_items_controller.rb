class Api::V1::Merchants::MostItemsController < ApplicationController
  def index 
    render json: MerchantSerializer.new(Merchant.merchants_by_most_items(params[:quantity]))
  end
end