require 'test_helper'

class SessionFormTest < ActiveSupport::TestCase
  setup do
    users(:akagi).then do |user|
      @form = SessionForm.new.tap do |s|
        s.id_name = user.id_name
        s.password = user.masked_password ^ 1234
      end
    end
    # pp @form.attributes
    # pp users(:akagi).attributes
    # pp @form.user
  end

  test "適正である" do
    assert @form.valid?
  end

  test "ID名が必要" do
    @form.id_name = nil
    assert @form.invalid?
  end

  test "パスワードが必要" do
    @form.password = nil
    assert @form.invalid?
  end

  test "ID名形式相違_数字" do
    @form.id_name = "1234"
    assert @form.invalid?
    assert_includes @form.errors.messages[:id_name], "は英小文字のみが使えます"
  end

  test "ID名形式相違_大文字" do
    @form.id_name = "ABCD"
    assert @form.invalid?
    assert_includes @form.errors.messages[:id_name], "は英小文字のみが使えます"
  end

  test "ID名形式相違_長さ" do
    @form.id_name = "abcdefg"
    assert @form.invalid?
    assert_includes @form.errors.messages[:id_name], "は最大6文字です"
  end

  test "存在しないユーザー" do
    @form.id_name = "xxxxxx"
    assert @form.invalid?
    assert_includes @form.errors.messages[:id_name], "が存在しません"
  end

  test "パスワード相違" do
    @form.password = 1111
    assert @form.invalid?
    assert_includes @form.errors.messages[:password], "が違います"
  end

  test "ユーザーを検索できる" do
    assert_respond_to @form, :user
  end
end
