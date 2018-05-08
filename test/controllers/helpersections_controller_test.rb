require 'test_helper'

class HelpersectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get helpersections_index_url
    assert_response :success
  end

end
