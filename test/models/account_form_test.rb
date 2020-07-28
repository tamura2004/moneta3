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
require 'test_helper'

class AccountFormTest < ActiveSupport::TestCase
  setup do
    @form = AccountForm.new(account_id: accounts(:one).id)
  end

  test "適正である" do
    assert @form.valid?
  end

  test "決済元口座が必要" do
    @form.account_id = nil
    assert @form.invalid?
  end

  test "残高不足" do
    a = accounts(:one)
    @form.amount = a.amount + a.minus_limit + 1 # １円だけ不足
    assert @form.invalid?
    assert_includes @form.errors.messages[:amount], "残高が不足しています"
  end

  test "残高不足ではない" do
    a = accounts(:one)
    @form.amount = a.amount + a.minus_limit
    assert @form.valid?
  end

  test "ユーザーを持つ" do
    assert_respond_to @form, :user
  end

  test "商品を持つ" do
    assert_respond_to @form, :product
  end

  test "支払い元口座を持つ" do
    assert_respond_to @form, :payment
  end

  test "作成口座を持つ" do
    assert_respond_to @form, :deposit
  end

  test "口座作成パラメータを出力できる" do
    get = @form.account_param.keys.sort
    want = %i(number amount start_date end_date product_id account_id user_id branch_id).sort
    assert_equal get, want
  end

  test "作成時に引き落としが行われる" do
    @form.amount = 1000
    @form.product_id = products(:futsu).id

    assert_difference "@form.payment.amount", -1000 do
      assert @form.save
    end
  end

  test "作成時に預入が行われる" do
    @form.amount = 1000
    @form.product_id = products(:futsu).id

    assert_difference "@form.deposit.amount", 1000 do
      assert @form.save
    end
  end
end
