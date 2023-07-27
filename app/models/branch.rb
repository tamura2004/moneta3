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
# 支店モデル
#
# @auther tamura2004@gmail.com
# @attribute id [Integer] データベースの主キー
# @attribute kana_name [String] かな名
# @attribute name [String] 支店名
# @attribute number [Integer] 支店番号
# @attribute bank_id [Integer] 属する銀行の主キー
# @attribute created_at [DateTime] レコード作成時刻
# @attribute updated_at [DateTime] レコード修正時刻
class Branch < ApplicationRecord
  # 必ず一つの銀行に属する
  belongs_to :bank

  # 複数の口座を持つ、支店が削除されるとき属する口座はすべて削除される
  has_many :accounts, dependent: :destroy

  # 支店名、支店番号は空であってはならない
  validates :name, :number, presence: true
end
