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
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  setup do
    @account = Account.new do |s|
      s.product = products(:futsu)
      s.number = "1234"
    end
  end

  test "適正である" do
    assert @account.valid?
  end

  test "商品が必要" do
    @account.product = nil
    assert @account.invalid?
  end

  test "番号が必要" do
    @account.number = nil
    assert @account.invalid?
  end

  test "金額を持てる" do
    @account.amount = 1000
    assert @account.valid?
  end

  test "開始日を持てる" do
    @account.start_date = Date.today
    assert @account.valid?
  end

  test "終了日を持てる" do
    @account.end_date = Date.today
    assert @account.valid?
  end

  test "支店を持てる" do
    @account.branch = branches(:one)
    assert @account.valid?
  end

  test "ユーザーを持てる" do
    @account.user = users(:akagi)
    assert @account.valid?
  end

  test "決済口座を持てる" do
    @account.account = accounts(:one)
    assert @account.valid?
  end

  test "支店に属する" do
    assert_respond_to @account, :branch
  end

  test "ユーザーに属する" do
    assert_respond_to @account, :user
  end

  test "商品に属する" do
    assert_respond_to @account, :product
  end

  test "決済口座に属する" do
    assert_respond_to @account, :account
  end

  test "取引明細を持つ" do
    assert_respond_to @account, :statements
  end

  test "ユーザーを持つ" do
    assert_respond_to @account, :users
  end

  test "決済先口座を持つ" do
    assert_respond_to @account, :accounts
  end

  test "借入区分を持つ" do
    assert_respond_to @account, :is_debit
  end

  test "金利を持つ" do
    assert_respond_to @account, :rate
  end

  test "通貨を持つ" do
    assert_respond_to @account, :currency
  end

  test "借入上限を持つ" do
    assert_respond_to @account, :minus_limit
  end

  test "表示名を持つ" do
    assert_equal @account.fullname, "普通預金 1234"
  end

  test "出金処理ができる" do
    accounts(:one).then do |a|
      before = a.amount
      s = a.withdrow(1000)
      assert_equal a.amount, before - 1000
      assert_equal s.amount, 1000
      assert_equal s.account, a
      assert_equal s.memo, "出金"
    end
  end

  test "入金処理ができる" do
    accounts(:one).then do |a|
      before = a.amount
      s = a.deposit(1000)
      assert_equal a.amount, before + 1000
      assert_equal s.amount, 1000
      assert_equal s.account, a
      assert_equal s.memo, "入金"
    end
  end

  test "解約処理ができる" do
    a = accounts(:one)
    b = accounts(:two)
    b.update(account: accounts(:one))

    want = a.amount + b.amount
    err = b.kaiyaku

    assert err.nil?
    assert b.destroyed?
    assert_equal want, a.amount
  end

  test "クレジットカードは解約できない" do
    a = accounts(:one)
    a.update(user: users(:akagi))
    err = a.kaiyaku
    assert_equal err, "クレジットカードは解約できません"
  end

  test "決済口座は解約できない" do
    a = accounts(:one)
    b = accounts(:two)
    a.update(account: b)
    err = b.kaiyaku
    assert_equal err, "決済口座は解約できません"
  end

  test "決済口座がないと解約できない" do
    b = accounts(:two)
    err = b.kaiyaku
    assert_equal err, "決済口座がありません"
  end

end
