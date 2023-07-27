# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# 状態モデル
#
# @attribute id [Integer] レコードの主キー
# @attribute name [String] 名称
# @attribute created_at [DateTime] レコードの作成時刻
# @attribute updated_at [DateTime] レコードの更新時刻
#
class State < ApplicationRecord
  # 複数の課題を持つ
  has_many :issues

  # 名称が空であってはならない
  validates :name, presence: true
end
