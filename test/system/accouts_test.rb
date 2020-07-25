require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  test "create account" do
    visit "/login"
    fill_in "id_name", with: "akagi"
    fill_in "password", with: "1234"
    click_on "commit"

    visit "/products/#{products(:futsu).id}/accounts/new"
    fill_in "amount", with: 1000000
    take_screenshot
    click_on "commit"
    assert_text "残高一覧"
  end

  test "fail creating account when less money" do
    visit "/login"
    fill_in "id_name", with: "akagi"
    fill_in "password", with: "1234"
    click_on "commit"

    visit "/products/#{products(:futsu).id}/accounts/new"
    fill_in "amount", with: 100_000_000
    click_on "commit"
    take_screenshot
    assert_text "残高が不足しています"
  end
end
