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
  # test "the truth" do
  #   assert true
  # end
end
