# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  credit_number   :string
#  id_name         :string
#  kana_name       :string
#  kanji_name      :string
#  masked_password :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
