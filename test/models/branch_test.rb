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
  setup do
    @branch = Branch.new do |b|
      b.name = "双子座支店"
      b.number = 123
      b.bank = banks(:one)
    end
  end

  test "適正である" do
    assert @branch.valid?
  end

  test "名前が必要" do
    @branch.name = nil
    assert @branch.invalid?
  end

  test "番号が必要" do
    @branch.number = nil
    assert @branch.invalid?
  end

  test "銀行に属する" do
    assert_respond_to @branch, :bank
  end

  test "口座を持つ" do
    assert_respond_to @branch, :accounts
  end
end
