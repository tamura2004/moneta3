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
require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
