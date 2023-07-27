# スピードくじコントローラ
#
# @author tamura2004@gmail.com
class LotteriesController < ApplicationController
  # 一覧
  def index
  end

  # くじ引き当選処理
  #
  # @exec くじ引き一回ごとに10万円引き落とされる
  # @exec id属性に応じて、100円〜10億円が入金される
  def show
    current_user.account.withdrow(100_000)
    @account = product.accounts.create(
      user: current_user,
      amount: 0,
      number: "%07d" % rand(1000000..9999999),
      account: current_user.account,
      branch: branch,
    )
    @account.deposit(amount)
    # @form = TransferForm.new
  end

  private

  # 金融商品レコード取得
  def product
    @product ||= Product.find_by(name: "スピードくじ")
  end

  # 支店をもねたカードにする
  def branch
    Branch.find_by(name: "もねたカード")
  end

  # 当選種別（１等〜８等）
  def rank
    @rank ||= params[:id].to_i
  end

  # 当選金額（100円〜10億円）
  def amount
    @amount ||= 10.pow(10 - rank)
  end
end
