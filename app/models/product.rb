# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  currency   :string           default("JPY")
#  is_debit   :boolean          default(FALSE)
#  name       :string           not null
#  rate       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  has_many :accounts
end
