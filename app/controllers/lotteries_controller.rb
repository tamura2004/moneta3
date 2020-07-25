class LotteriesController < ApplicationController
  def index
  end

  def show
    current_user.account.withdrow(100_000)
    @account = product.accounts.create(
      user: current_user,
      amount: 0,
      number: "%07d" % rand(1000000 .. 9999999),
      account: current_user.account,
      branch: branch
    )
    @account.deposit(amount)
  end

  private

  def product
    @product ||= Product.find_by(name: "スピードくじ")
  end

  def branch
    Branch.find_by(name: "もねたカード")
  end

  def rank
    @rank ||= params[:id].to_i
  end

  def amount
    @amount ||= 10.pow(10 - rank)
  end
end
