require 'test_helper'

class NumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get numbers_new_url
    assert_response :success
  end

  test "should get edit" do
    get numbers_edit_url
    assert_response :success
  end

end
