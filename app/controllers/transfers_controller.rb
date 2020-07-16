class TransfersController < ApplicationController
  before_action :set_form, except: [:new]

  def new
    @form = TransferForm.new
    @accounts = current_user.accounts.joins(:product).where("not products.is_fixed").where("not products.is_credit")
  end

  def select_bank
    @banks = Bank.all
  end

  def select_branch
    @bank = Bank.find(@form.bank_id)
    @branches = @bank.branches
  end

  def select_account
  end

  def create
    @from = Account.find(@form.from_id)
    @to = Account.find_by(number: @form.account_number)
    amount = @form.amount.to_i
    @from.amount -= amount
    @to.amount += amount
    @from.save
    @to.save
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
