require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get quiz_start_url
    assert_response :success
  end

end
