class Api::V1::Transactions::SearchController < ApplicationController
  def index 
    render json: TransactionSerializer.new(Transaction.find_all_by_parameters(search_params))
  end
  
  def show
    render json: TransactionSerializer.new(Transaction.find_by(search_params))
  end

  private 

  def search_params 
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end
end