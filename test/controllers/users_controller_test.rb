require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index users" do
    get users_path
    assert_response :success
    assert_match "ユーザー一覧", @response.body
  end
  
  test "new user" do
    get new_user_path
    assert_response :success
    assert_match "新規ご利用者登録", @response.body
  end
  
  test "create user" do
    assert_difference "User.count" do
      post users_path, params: { user_form: { id_name: "taro", password: "1234", name: "太郎", kana_name: "たろう", credit_number: "1234-5678-9012"}}
    end
    assert_redirected_to users_path
    follow_redirect!
    assert_response :success
    assert_match "太郎", @response.body
  end
end
