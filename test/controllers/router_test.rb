require "test_helper"

class RouterTest < ActionDispatch::IntegrationTest
  def assert_route(method, path, controller, action, params = {})
    send(method, path, params: params)
    assert_equal controller, @request.params[:controller]
    assert_equal action, @request.params[:action]
  end

  test "router" do
    # メニュー
    assert_route :get, "/", "pages", "show"
    assert_route :get, "/pages/1", "pages", "show"

    # ログイン
    assert_route :get, "/login", "sessions", "new"
    assert_route :post, "/sessions", "sessions", "create", session_form: { id_name: "a" }

    # サインイン
    assert_route :get, "/signin", "users", "new"
    assert_route :post, "/users", "users", "create", user_form: { id_name: "a" }

    # 口座開設・解約
    assert_route :get, "/products/1/accounts/new", "accounts", "new"
    assert_route :post, "/accounts", "accounts", "create"
    assert_route :get, "/accounts", "accounts", "index"
    assert_route :delete, "/accounts/1", "accounts", "destroy"
    
    # 取引明細
    assert_route :get, "/accounts/1/statements", "statements", "index"
    
    # 振込
    assert_route :get, "/transfer/new", "transfers", "new"
    assert_route :post, "/transfer/bank", "transfers", "bank"
    assert_route :post, "/transfer/branch", "transfers", "branch"
    assert_route :post, "/transfer/account", "transfers", "account"
    assert_route :post, "/transfers", "transfers", "create"
    
    # スピードくじ
    assert_route :get, "/lotteries", "lotteries", "index"
    assert_route :get, "/lotteries/1", "lotteries", "show"
    
    # バグ報告
    assert_route :get, "/admin/state/1/issues", "admin/issues", "index"
    assert_route :get, "/admin/state/1/issues/new", "admin/issues", "new"
    assert_route :get, "/admin/state/1/issues/2", "admin/issues", "show"
    assert_route :get, "/admin/state/1/issues/2/edit", "admin/issues", "edit"
    assert_route :post, "/admin/state/1/issues", "admin/issues", "create"
    assert_route :post, "/admin/state/1/issues/2", "admin/issues", "update"
    
    # API
    assert_route :get, "/api/v1/accounts", "api/v1/accounts", "index"
    assert_route :get, "/api/v1/banks", "api/v1/banks", "index"
    assert_route :get, "/api/v1/branches", "api/v1/branches", "index"
    assert_route :get, "/api/v1/pages", "api/v1/pages", "index"
    assert_route :get, "/api/v1/products", "api/v1/products", "index"
    assert_route :get, "/api/v1/users", "api/v1/users", "index"
  end
end
