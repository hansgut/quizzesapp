require 'test_helper'

class AttemptsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attempts_new_url
    assert_response :success
  end

  test "should get show" do
    get attempts_show_url
    assert_response :success
  end

end
