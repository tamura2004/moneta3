# == Schema Information
#
# Table name: branches
#
#  id         :integer          not null, primary key
#  kana_name  :string
#  name       :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bank_id    :integer
#
# Indexes
#
#  index_branches_on_bank_id  (bank_id)
#
# Foreign Keys
#
#  bank_id  (bank_id => banks.id)
#
require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  test "should not name be null" do
    assert_raises ActiveRecord::NotNullViolation do
      Bank.new.save
    end
  end

  test "belongs to bank" do
    assert branches(:one).bank == banks(:one)
  end

  test "has many accounts" do
    assert branches(:one).accounts
  end
end
