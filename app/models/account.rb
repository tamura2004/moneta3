# == Schema Information
#
# Table name: accounts
#
#  id          :integer          not null, primary key
#  amount      :integer          default(0)
#  end_date    :date
#  number      :string           not null
#  start_date  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#  branch_id   :integer
#  currency_id :integer
#  product_id  :integer
#  user_id     :integer
#
# Indexes
#
#  index_accounts_on_account_id   (account_id)
#  index_accounts_on_branch_id    (branch_id)
#  index_accounts_on_currency_id  (currency_id)
#  index_accounts_on_product_id   (product_id)
#  index_accounts_on_user_id      (user_id)
#
class Account < ApplicationRecord
  # 一つの支店を持つが、空でも良い
  belongs_to :branch, optional: true

  # 一つの利用者を持つが、空でも良い
  belongs_to :user, optional: true

  # 一つの金融商品を必ず持つ
  belongs_to :product

  # 一つの通貨に属する
  belongs_to :currency

  # 一つの口座を決済口座として持つが、空でも良い
  belongs_to :account, optional: true

  # 複数の明細を持つ。口座が削除されるとき、明細もすべて削除される。
  has_many :statements, dependent: :destroy

  # 複数の利用者を持つ、口座が削除されるとき、利用者もすべて削除される。
  has_many :users, dependent: :destroy

  # 自身を決済口座とする複数の口座を持つ
  has_many :accounts, dependent: :destroy

  # 口座番号は空ではいけない
  validates :number, presence: true

  # 処理を金融商品に移譲
  delegate :name, :is_debit, :is_fixed, :rate, :minus_limit, to: :product

  # 決済口座として使用できるか
  #
  # @return [Boolean] 決済口座として使用できるか（固定性預金でなく借入でない）
  scope :settlement, -> { joins(:product).where.not("products.is_fixed or products.is_debit") }

  # 固定性預金ではないか
  #
  # @return [Boolean] 固定性預金ではない
  scope :not_fixed, -> { joins(:product).where.not("products.is_fixed") }

  # 表示名
  #
  # @return [String] 科目名＋口座番号を返す
  # @example "普通 0123456"
  def fullname
    product.name + " " + number
  end

  # 出金処理
  #
  # @param money [Integer] 出金額
  # @param memo [String] 適用
  # @return [ActiveRecord::Base] 取引明細レコード
  def withdrow(money, memo = "出金")
    update(amount: amount - money)
    Statement.create(amount: money, account_id: id, memo: memo)
  end

  # 入金処理
  #
  # @param money [Integer] 入金額
  # @param memo [String] 適用
  # @return [ActiveRecord::Base] 取引明細レコード
  def deposit(money, memo = "入金")
    update(amount: amount + money)
    Statement.create(amount: money, account_id: id, memo: memo)
  end

  # 利息付与処理
  #
  # @param money [Integer] 利息額
  # @param memo [String] 適用
  # @return [ActiveRecord::Base] 取引明細レコード
  def interest(money, memo = "利息")
    update(amount: amount + money)
    Statement.create(amount: money, account_id: id, memo: memo)
  end

  # 解約処理
  #
  # @return [Nil] nil
  def kaiyaku
    return "クレジットカードは解約できません" if users.present?
    return "決済口座は解約できません" if accounts.present?
    return "決済口座がありません" unless account
    return "#{name}は期限まで解約できません" if is_fixed
    sign = is_debit ? -1 : 1 # 借入なら決済口座の金額を減らす
    account.deposit(sign * amount * currency.rates.last.rate, name)
    destroy
    return nil
  end
end
