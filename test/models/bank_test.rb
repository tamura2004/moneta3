# == Schema Information
#
# Table name: banks
#
#  id         :integer          not null, primary key
#  kana_name  :string
#  kanji_name :string           not null
#  myself     :boolean          not null
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
