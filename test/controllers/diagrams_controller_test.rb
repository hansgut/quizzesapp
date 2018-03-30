require 'test_helper'

class DiagramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diagrams_index_url
    assert_response :success
  end

end
