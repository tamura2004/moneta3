class Api::V1::AccountsController < ActionController::API
  def index
    accounts = Account.all
    render json: accounts
  end
end
