# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  description :text
#  path        :string
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  page_id     :integer
#
# Indexes
#
#  index_pages_on_page_id  (page_id)
#
# Foreign Keys
#
#  page_id  (page_id => pages.id)
#
# 画面モデル
# 各表示画面の情報を持つ
#
# @auther tamura2004@gmail.com
# @attribute id [Integer] レコードの主キー
# @attribute description [String] 画面の説明
# @attribute path [String] 画面のurl
# @attribute title [String] 画面の表題
# @attribute created_at [DateTime] レコードの作成時刻
# @attribute updated_at [DateTime] レコードの更新時刻
# @attribute page_id [Integer] 遷移元画面の外部キー
class Page < ApplicationRecord
  # 複数の遷移先画面（子画面）を持つ。本画面が削除される場合、子画面も削除される。
  has_many :pages, dependent: :destroy

  # 一つの遷移元画面を持つ。遷移元画面は空でも良い（トップページ）
  belongs_to :page, optional: true

  # 画面の表題は空であってはならない
  validates :title, presence: true
end
