class TransferForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :from_id, :integer
  attribute :bank_id, :integer
  attribute :branch_id, :integer
  attribute :account_number, :integer
  attribute :amount, :integer
  attribute :memo, :string

  validates :from_id, :bank_id, :branch_id, :account_number, :amount, presence: { message: "%{attribute}を入力して下さい"}
  validates :amount, numericality: { only_integer: true, message: "数値を入力して下さい" }

  validate :account_present
  validate :amount_remain

  def account_present
    if !Account.find_by(number: account_number)
      errors.add(:account_number, "振込先口座が存在しません")
    end
  end

  def amount_remain
    @from_account = Account.find(from_id)
    if amount > @from_account.amount + @from_account.minus_limit
      errors.add(:amount, "残高が不足しています")
    end
  end

  def save
    return false if invalid?
    @from = Account.find(from_id)
    @to = Account.find_by(number: account_number)
    @from.withdrow(amount) && @to.deposit(amount)
  end
end
