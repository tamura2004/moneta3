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
# 銀行モデル
#
# @auther tamura2004@gmail.com
# @attribute id [Integer] 銀行レコードの主キー
# @attribute kana_name [String] かな名称
# @attribute myself [Boolean] 自行であるか
# @attribute name [String] 名称
# @attribute number [Integer] 金融機関番号
# @attribute created_at [DateTime] レコード作成時刻
# @attribute updated_at [DateTime] レコード更新時刻
#
class Bank < ApplicationRecord
  # 複数の支店を持つ。銀行が削除されるとき支店も削除される
  has_many :branches, dependent: :destroy

  # 名称と金融機関番号は空であってはならない
  validates :name, :number, presence: true

  # 自行区分はtrueまたはfalseである
  validates :myself, inclusion: { in: [true, false] }

  # 自行レコードを取得
  #
  # @return [ActiveRecord::Base]
  def self.me
    find_by(myself: true)
  end
end
