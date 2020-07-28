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
  setup do
    @bank = Bank.new do |b|
      b.myself = false
      b.name = "もねた銀行"
      b.number = 1234
    end
  end

  test "適正である" do
    assert @bank.valid?
  end

  test "名前が必要" do
    @bank.name = nil
    assert @bank.invalid?
  end

  test "番号が必要" do
    @bank.number = nil
    assert @bank.invalid?
  end

  test "自社区分が必要" do
    @bank.myself = nil
    assert @bank.invalid?
  end

  test "支店を持つ" do
    assert_respond_to @bank, :branches
  end

  test "自社を選択できる" do
    assert_equal Bank.me.id, banks(:one).id
  end
end
