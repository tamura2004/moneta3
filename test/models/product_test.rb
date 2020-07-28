# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  currency    :string           default("JPY")
#  is_credit   :boolean          default(FALSE)
#  is_debit    :boolean          default(FALSE)
#  is_fixed    :boolean          default(FALSE)
#  minus_limit :integer          default(0)
#  name        :string           not null
#  rate        :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = Product.new do |s|
      s.name = "商品名"
    end
  end

  test "適正である" do
    assert @product.valid?
  end

  test "名前が必要" do
    @product.name = nil
    assert @product.invalid?
  end

  test "通貨を持てる" do
    @product.currency = "JPY"
    assert @product.valid?
  end

  test "クレジットカード区分を持てる" do
    @product.is_credit = true
    assert @product.valid?
  end

  test "借入区分を持てる" do
    @product.is_debit = true
    assert @product.valid?
  end

  test "固定区分を持てる" do
    @product.is_fixed = true
    assert @product.valid?
  end

  test "貸越極度を持てる" do
    @product.minus_limit = 1000000
    assert @product.valid?
  end

  test "金利を持てる" do
    @product.rate = 1.23
    assert @product.valid?
  end

  test "口座を持つ" do
    assert_respond_to @product, :accounts
  end
end
