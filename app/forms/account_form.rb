class AccountForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :amount, :integer, default: 0
  attribute :number, :string, default: -> { "%07d" % rand(10000000) }
  attribute :start_date, :date, default: -> { Date.today }
  attribute :end_date, :date, default: -> { 1.years.after }
  attribute :account_id, :integer
  attribute :product_id, :integer
  attribute :branch_id, :integer
  attribute :user_id, :integer

  validates :amount, presence: { message: "%{attribute}を入力して下さい" }
  validates :amount, numericality: { only_integer: true, greater_than: 1000, message: "1000円以上の数値を入力して下さい" }

  def product
    Product.find(product_id)
  end

  def accounts
    user.accounts.not_fixed.map{|v|[v.fullname, v.id]}
  end

  def branches
    Bank.me.branches.pluck(:name, :id)
  end

  def user
    User.find(user_id)
  end

  def save
    return false if invalid?
    deposit = Account.new(account_param)

    payment = Account.find(deposit.account_id)
    if deposit.save && payment
      payment.withdrow(amount) && deposit.deposit(amount)
    else
      false
    end
  end

  def account_param
    @account_param ||= attributes.symbolize_keys.extract!(:number, :amount, :start_date, :end_date, :product_id, :account_id, :user_id, :branch_id)
  end
end
