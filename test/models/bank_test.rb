# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  kana_name  :string
#  myself     :boolean          not null
#  name       :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class BankTest < ActiveSupport::TestCase
  test "should not save bank without name" do
    bank = Bank.new
    assert_raises ActiveRecord::NotNullViolation do
      bank.save
    end
  end

  test "get myself true by self.me" do
    assert Bank.me == banks(:one)
  end
end
