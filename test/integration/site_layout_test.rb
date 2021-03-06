require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout_links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", faqs_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    get subscribe_path
    assert_select "title", full_title("Subscribe") 
  end
end
