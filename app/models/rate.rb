# == Schema Information
#
# Table name: rates
#
#  id          :integer          not null, primary key
#  changed_at  :datetime
#  rate        :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  currency_id :integer          not null
#
# Indexes
#
#  index_rates_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  currency_id  (currency_id => currencies.id)
#
# 為替レート変更履歴モデル
class Rate < ApplicationRecord
  # 通貨モデルに属する
  belongs_to :currency
end
