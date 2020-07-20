class TransfersController < ApplicationController
  before_action :set_form, except: [:new]
  before_action :set_from_account, only: [:bank, :branch, :account]
  before_action :set_bank, only: [:branch, :account]
  before_action :set_branch, only: [:account]

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
    @form = TransferForm.new(form_param)
    if @form.save
      redirect_to accounts_url
    else
      render :account
    end
  end

  private

  def set_form
    @form = TransferForm.new(form_param)
  end

  def set_from_account
    @from_account = Account.find(@form.from_id)
  end

  def set_bank
    @bank = Bank.find(@form.bank_id)
  end

  def set_branch
    @branch = Branch.find(@form.branch_id)
  end

  def form_param
    params.require(:transfer).permit(:from_id, :bank_id, :branch_id, :account_id, :amount, :memo, :account_number)
  end
end
