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
  setup do
    @page = Page.new do |p|
      p.title = "タイトル"
    end
  end

  test "適正である" do
    assert @page.valid?
  end

  test "タイトルが必要" do
    @page.title = nil
    assert @page.invalid?
  end

  test "urlパスを持てる" do
    @page.path = "/pages"
    assert @page.valid?
  end

  test "説明を持てる" do
    @page.description = "ページの説明"
    assert @page.valid?
  end

  test "親ページを持てる" do
    @page.page = pages(:one)
    assert @page.valid?
  end

  test "子ページを持つ" do
    assert_respond_to @page, :pages
  end

  test "親ページに属する" do
    assert_respond_to @page, :page
  end
end
