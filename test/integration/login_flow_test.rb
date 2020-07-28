require 'test_helper'

class LoginFLowTest < ActionDispatch::IntegrationTest
  test "login successes" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "akagi", password: 1234 }}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div", "ようこそ、赤城一郎様"
  end

  test "login fails when password wrong" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "akagi", password: 1111 }}
    assert_response :success
    assert_select "div", "パスワードが違います"
  end

  test "login fails when password length too long" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "akagi", password: 11111 }}
    assert_response :success
    assert_select "div", "パスワードは数字4文字です"
  end

  test "login fails when password length too short" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "akagi", password: 111 }}
    assert_response :success
    assert_select "div", "パスワードは数字4文字です"
  end

  test "login fails when user id format wrong" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "Akagi", password: 1234 }}
    assert_response :success
    assert_select "div", "ユーザーIDは英小文字のみが使えます"
  end

  test "login fails when user id too long" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "akagisan", password: 1234 }}
    assert_response :success
    assert_select "div", "ユーザーIDは最大6文字です"
  end

  test "login fails when user id is not exist" do
    get "/sessions/new"
    post "/sessions", params: { session_form: { id_name: "nobody", password: 1234 }}
    assert_response :success
    assert_select "div", "ユーザーIDが存在しません"
  end
end
