require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get media_show_url
    assert_response :success
  end

end
