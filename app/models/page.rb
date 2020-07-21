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
class Page < ApplicationRecord
  has_many :pages, dependent: :destroy
  belongs_to :page, optional: true
end
