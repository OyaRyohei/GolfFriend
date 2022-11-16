require "test_helper"

class Public::ChatMessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_chat_messages_show_url
    assert_response :success
  end
end
