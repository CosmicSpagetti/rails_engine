class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: TotalRevenueSerializer.new(Transaction.revenue_by_date(params[:date]))
  end
  
  def show
    merchant = Merchant.find(params[:id])
    if params[:date]
      render json: RevenueSerializer.new(merchant.revenue_by_merchant_by_date(params[:date]))
    else
      render json: RevenueSerializer.new(merchant.revenue_by_merchant)
    end
  end
end