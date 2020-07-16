class TransfersController < ApplicationController
  before_action :set_form, except: [:new]

  def new
    @form = TransferForm.new
    @accounts = current_user.accounts.settlement
  end

  def bank
    c = (Bank.count + 1) / 2
    @banks_left = Bank.limit(c)
    @banks_right = Bank.offset(c)
  end

  def branch
    @bank = Bank.find(@form.bank_id)
    @branches = @bank.branches
    c = (@branches.count + 1) / 2
    @branches_left = @branches.limit(c)
    @branches_right = @branches.offset(c)
  end

  def account
  end

  def create
    @from = Account.find(@form.from_id)
    @to = Account.find_by(number: @form.account_number)

    money = @form.amount.to_i
    @from.withdrow(money)
    @to.deposit(money)

    redirect_to accounts_url
  end

  private

  def set_form
    @form = TransferForm.new(form_param)
  end

  def form_param
    params.require(:transfer).permit(:from_id, :bank_id, :branch_id, :account_id, :amount, :memo, :account_number)
  end
end
