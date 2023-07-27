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
# 取引明細モデル
#
# @attribute id [Integer] レコードの主キー
# @attribute amount [Integer] 取引金額
# @attribute memo [Integer] 適用
# @attribute created_at [Integer] レコードの作成時刻
# @attribute updated_at [Integer] レコードの更新時刻
# @attribute account_id [Integer] 口座の外部キー
class Statement < ApplicationRecord
  # 一つの口座に属する
  belongs_to :account

  # 取引金額は空であってはならない
  validates :amount, presence: true
end
