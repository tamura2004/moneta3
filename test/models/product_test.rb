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
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
