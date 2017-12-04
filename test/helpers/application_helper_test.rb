require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "It's Walk Time"
    assert_equal full_title("FAQs"), "FAQs | It's Walk Time"
  end
end