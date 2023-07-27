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
# 金融商品・口座種別
#
# @author tamura2004@gmail.com
# @attribute id [Integer] レコードの主キー
# @attribute currency [String] 通貨
# @attribute is_credit [Boolean] クレジットカードであるか
# @attribute is_debit [Boolean] 借入であるか
# @attribute is_fixed [Boolean] 固定性であるか
# @attribute minus_limit [Integer] 貸越の上限
# @attribute name [String] 名称
# @attribute rate [Decimal] 金利
# @attribute created_at [DateTime] レコードの作成時刻
# @attribute updated_at [DateTime] レコードの更新時刻
#
class Product < ApplicationRecord
  # 複数の口座を持つ。自身が削除されるとき口座もすべて削除される
  has_many :accounts, dependent: :destroy

  # 名称は空であってはならない
  validates :name, presence: true
end
