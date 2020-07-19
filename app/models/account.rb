# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  amount     :integer          default(0)
#  end_date   :date
#  number     :string           not null
#  start_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#  branch_id  :integer
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_accounts_on_account_id  (account_id)
#  index_accounts_on_branch_id   (branch_id)
#  index_accounts_on_product_id  (product_id)
#  index_accounts_on_user_id     (user_id)
#
class Account < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :user, optional: true
  belongs_to :product
  has_many :statements

  delegate :name, :is_debit, :rate, :currency, to: :product

  before_validation :assign_number

  scope :settlement, -> { joins(:product).where.not("products.is_fixed or products.is_credit") }

  def fullname
    product.name + " " + number
  end

  def withdrow(money, memo = "出金")
    update(amount: amount - money)
    Statement.create(amount: money, account_id: id, memo: memo)
  end

  def deposit(money, memo = "入金")
    update(amount: amount + money)
    Statement.create(amount: money, account_id: id, memo: memo)
  end

  def assign_number
    unless number.present?
      seed = DigitValue.sample(2,2)
      seed << seed.sum
      self.number = seed.map(&:to_s).join
    end
  end
end
