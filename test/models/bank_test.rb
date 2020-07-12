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
require 'test_helper'

class BankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
