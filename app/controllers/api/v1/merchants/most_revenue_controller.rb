class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.best_merchants(params[:quantity]))
  end  
end