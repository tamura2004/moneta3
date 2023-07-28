# == Schema Information
#
# Table name: currencies
#
#  id          :integer          not null, primary key
#  description :string
#  name        :string
#  rate_max    :float
#  rate_min    :float
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
