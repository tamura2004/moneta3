require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "login" do
    visit "/"

    assert_text "もねた銀行"

    click_on "Login"

    assert_selector "h1", text: "ログイン"
    assert_selector "form"

    fill_in "id_name", with: "akagi"
    fill_in "password", with: "1234"

    take_screenshot
    click_on "commit"

    assert_text "ようこそ、赤城一郎様"
  end

  test "signin" do
    visit signin_path

    fill_in "id_name", with: "taro"
    fill_in "password", with: "1234"
    fill_in "name", with: "太郎"
    fill_in "kana_name", with: "たろう"
    fill_in "credit_number", with: "1234-5678-9012"

    take_screenshot
    click_on "commit"

    assert_text "マスク化パスワード"
    assert_text "太郎"
  end
end
