require 'test_helper'
class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,              "IST Portal"
    assert_equal full_title("Help"),      "Help | IST Portal"
  end
end