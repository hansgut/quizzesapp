require 'test_helper'

class TheoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theories_index_url
    assert_response :success
  end

  test "should get new" do
    get theories_new_url
    assert_response :success
  end

  test "should get edit" do
    get theories_edit_url
    assert_response :success
  end

  test "should get show" do
    get theories_show_url
    assert_response :success
  end

end
