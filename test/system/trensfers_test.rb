require "application_system_test_case"

class TransfersTest < ApplicationSystemTestCase
  test "transfer" do
    visit "/login"
    fill_in "id_name", with: "akagi"
    fill_in "password", with: "1234"
    click_on "commit"

    visit "/transfer/new"
    click_on "選択" # 振込元口座
    click_on "選択" # 銀行
    click_on "選択" # 支店
    fill_in "account_number", with: "12345678"
    fill_in "amount", with: 10000

    take_screenshot
    click_on "commit"
    assert_text "残高一覧"
  end
end
