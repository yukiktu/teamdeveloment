require 'test_helper'

class ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arrivals_index_url
    assert_response :success
  end

  test "should get edit" do
    get arrivals_edit_url
    assert_response :success
  end

end
