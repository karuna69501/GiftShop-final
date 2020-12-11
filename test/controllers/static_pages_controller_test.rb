require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get homepage" do
    get static_pages_homepage_url
    assert_response :success
  end

  test "should get productCatalog" do
    get static_pages_productCatalog_url
    assert_response :success
  end

  test "should get deliveryInfo" do
    get static_pages_deliveryInfo_url
    assert_response :success
  end

  test "should get ContactUs" do
    get static_pages_ContactUs_url
    assert_response :success
  end

end
