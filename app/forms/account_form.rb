# 口座開設の入力情報を保持するフォームオブジェクト
class AccountForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :integer, default: 0 # 取引金額
  attribute :number, :string, default: -> { "%07d" % rand(10000000) } # 口座番号
  attribute :start_date, :date, default: -> { Date.today } # 開始日
  attribute :end_date, :date, default: -> { 1.years.after } # 満期日
  attribute :account_id, :integer # 口座ID（内部情報）
  attribute :product_id, :integer # 商品ID（内部情報）
  attribute :branch_id, :integer # 支店ID（内部情報）
  attribute :user_id, :integer # お客様ID（内部情報）

  validates :amount, :account_id, presence: true # 取引金額と口座IDは必須項目
  validate :amount_less

  # 残高不足チェック
  def amount_less
    return unless payment
    return if product.is_debit
    return if payment&.product&.is_credit

    if payment.amount + payment.minus_limit < amount
      errors.add :amount, "残高が不足しています"
    end
  end

  # 決済口座
  def accounts
    user.accounts.settlement.map { |v| [v.fullname, v.id] }
  end

  def branches
    Bank.me.branches.pluck(:name, :id)
  end

  # 取引内容を保存
  def save
    # 入力内容にエラーがあるなら、何もせずに終了
    return false if invalid?

    # 預入口座の内容を保存、かつ支払い口座があれば、ブロック内を実施
    if deposit.save && payment
      sign = product.is_debit ? -1 : 1 # 借入なら金額を増やす
      memo = "#{deposit.product.name}への支払い"

      # withdrow = 支払い
      # deposit = 入金
      payment.withdrow(sign * amount, memo) && deposit.deposit(amount)

      # 金利(rate), 利息(interest)
      if product.rate > 0
        interest = amount * product.rate / 100
        memo = "利息（#{product.rate}％）"
        deposit.interest(interest, memo)
      end
      true
    else
      false
    end
  end

  # 入力画面からパラメーター（＝入力内容）を受け取る
  def account_param
    @account_param ||= attributes.symbolize_keys.extract!(:number, :amount, :start_date, :end_date, :product_id, :account_id, :user_id, :branch_id)
  end

  # 作成口座（預入=deposit）
  def deposit
    @deposit ||= Account.new(account_param)
  end

  # 決済口座（支払い=payment）
  def payment
    @payment ||= Account.find_by(id: account_id)
  end

  # 商品種別
  def product
    @product ||= Product.find_by(id: product_id)
  end

  # 利用ユーザー
  def user
    @user ||= User.find_by(id: user_id)
  end
end
