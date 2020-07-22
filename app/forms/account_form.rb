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

  validates :amount, presence: true
  validates :amount, numericality: { only_integer: true, message: "数値を入力して下さい" }

  def accounts
    user.accounts.not_fixed.map{|v|[v.fullname, v.id]}
  end

  def branches
    Bank.me.branches.pluck(:name, :id)
  end

  def save
    return false if invalid?
    if deposit.save && payment
      payment.withdrow(amount) && deposit.deposit(amount)
    else
      false
    end
  end

  def account_param
    @account_param ||= attributes.symbolize_keys.extract!(:number, :amount, :start_date, :end_date, :product_id, :account_id, :user_id, :branch_id)
  end

  def deposit
    @deposit ||= Account.new(account_param)
  end

  def payment
    @payment ||= Account.find(account_id)
  end

  def product
    @product ||= Product.find(product_id)
  end

  def user
    @user ||= User.find(user_id)
  end
end