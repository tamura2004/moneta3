# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  id_name         :string
#  kana_name       :string
#  masked_password :integer
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :integer
#
# Indexes
#
#  index_users_on_account_id  (account_id)
#
# Foreign Keys
#
#  account_id  (account_id => accounts.id)
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new do |s|
      s.id_name = "taro"
      s.masked_password = 0
      s.name = "太郎"
      s.account = accounts(:one)
    end
  end

  test "適正である" do
    assert @user.valid?
  end

  test "ID名が必要" do
    @user.id_name = nil
    assert @user.invalid?
  end

  test "名前が必要" do
    @user.name = nil
    assert @user.invalid?
  end

  test "パスワードが必要" do
    @user.masked_password = nil
    assert @user.invalid?
  end

  test "基本口座が必要" do
    @user.account = nil
    assert @user.invalid?
  end

  test "基本口座に属する" do
    assert_respond_to @user, :account
  end

  test "口座を持つ" do
    assert_respond_to @user, :accounts
  end

  test "バグ報告を持つ" do
    assert_respond_to @user, :issues
  end

  test "口座フォームを作成できる" do
    assert_respond_to @user, :account_form
    form = users(:akagi).account_form(products(:futsu))
    assert_kind_of AccountForm, form
    assert_equal form.user_id, users(:akagi).id
    assert_equal form.product_id, products(:futsu).id
  end
end
