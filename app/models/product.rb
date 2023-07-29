# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  is_credit   :boolean          default(FALSE)
#  is_debit    :boolean          default(FALSE)
#  is_fixed    :boolean          default(FALSE)
#  minus_limit :integer          default(0)
#  name        :string           not null
#  rate        :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  # 複数の口座を持つ。自身が削除されるとき口座もすべて削除される
  has_many :accounts, dependent: :destroy

  # 名称は空であってはならない
  validates :name, presence: true
end
