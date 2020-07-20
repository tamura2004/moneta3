class AccountForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :integer
  attribute :number, :string
  attribute :start_date, :date
  attribute :end_date, :date
  attribute :account_id, :integer
  attribute :product_id, :integer
  attribute :branch_id, :integer
  attribute :user_id, :integer
  attribute :branches
  attribute :accounts

  validates :amount, presence: { message: "%{attribute}を入力して下さい" }
  validates :amount, numericality: { only_integer: true, message: "数値を入力して下さい" }

  def save
    return false if invalid?
    to_account = Account.new(account_param)
    to_account.number ||= DigitValue.sample(1, 7).to_s
    from_account = Account.find(account.account_id)
    if to_account.save && from_account
      from_account.withdrow(amount) && to_account.deposit(amount)
    else
      false
    end
  end

  def account_param
    @account_param ||= attributes.symbolize_keys.extract!(:number, :amount, :start_date, :end_date, :product_id, :account_id, :user_id, :branch_id)
  end
end
