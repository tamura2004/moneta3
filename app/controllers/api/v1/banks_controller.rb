class Api::V1::BanksController < ActionController::API
  def index
    banks = Bank.all
    render json: banks
  end
end
