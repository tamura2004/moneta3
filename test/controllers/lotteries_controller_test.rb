require 'test_helper'

class LotteriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    login users(:akagi)
    get lotteries_url
    assert_response :success
    assert_select "body" do
      assert_select "main" do
        assert_select "div.container" do
          assert_select "script"
        end
      end
    end
  end

  test "show 8th prize" do
    login users(:akagi)
    get lottery_url(8)
    assert_select "h1", "8等"
    assert_select "p", "100円"
  end

  test "show 1st prize" do
    login users(:akagi)
    get lottery_url(1)
    assert_select "h1", "1等"
    assert_select "p", "1,000,000,000円"
  end
end
