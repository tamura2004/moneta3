# == Schema Information
#
# Table name: statements
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  memo       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Indexes
#
#  index_statements_on_account_id  (account_id)
#
# Foreign Keys
#
#  account_id  (account_id => accounts.id)
#
require 'test_helper'

class StatementTest < ActiveSupport::TestCase
  setup do
    @statement = Statement.new do |s|
      s.amount = 1000
      s.account = accounts(:one)
    end
  end

  test "適正である" do
    assert @statement.valid?
  end

  test "金額が必要" do
    @statement.amount = nil
    assert @statement.invalid?
  end

  test "口座が必要" do
    @statement.account = nil
    assert @statement.invalid?
  end

  test "口座に属する" do
    assert_respond_to @statement, :account
  end
end
