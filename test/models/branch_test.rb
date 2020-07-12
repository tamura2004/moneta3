# == Schema Information
#
# Table name: branches
#
#  id         :integer          not null, primary key
#  kana_name  :string
#  name       :string           not null
#  number     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bank_id    :integer
#
# Indexes
#
#  index_branches_on_bank_id  (bank_id)
#
# Foreign Keys
#
#  bank_id  (bank_id => banks.id)
#
require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
