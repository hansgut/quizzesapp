require 'test_helper'

class DeterminationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get determinations_index_url
    assert_response :success
  end

  test "should get new" do
    get determinations_new_url
    assert_response :success
  end

  test "should get edit" do
    get determinations_edit_url
    assert_response :success
  end

  test "should get show" do
    get determinations_show_url
    assert_response :success
  end

end
