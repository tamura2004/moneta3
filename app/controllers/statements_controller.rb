class StatementsController < ApplicationController
  def index
    @account = Account.find(params[:account_id])
    @statements = @account.statements
  end
end
