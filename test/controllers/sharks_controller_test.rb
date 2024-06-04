require "test_helper"

class SharksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shark = sharks(:one)
  end

  test "should get index" do
    get sharks_url
    assert_response :success
  end

  test "should get new" do
    # Fornecer credenciais de autenticação
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("name", "password")

    get new_shark_url, headers: { "Authorization" => credentials }

    assert_response :success
  end

  test "should create shark" do
    assert_difference("Shark.count") do
      post sharks_url, params: { shark: { facts: @shark.facts, name: @shark.name } }
    end

    assert_redirected_to shark_url(Shark.last)
  end

  test "should show shark" do
    get shark_url(@shark)
    assert_response :success
  end

  test "should get edit" do
    # Fornecer credenciais de autenticação
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("name", "password")

    get edit_shark_url(@shark), headers: { "Authorization" => credentials }

    assert_response :success
  end


  test "should update shark" do
    # Fornecer credenciais de autenticação
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("name", "password")

    patch shark_url(@shark), headers: { "Authorization" => credentials }, params: { shark: { facts: @shark.facts, name: @shark.name } }

    assert_redirected_to shark_url(@shark)
  end


  test "should destroy shark" do
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials("name", "password")

  assert_difference("Shark.count", -1) do
    delete shark_url(@shark), headers: { "Authorization" => credentials }
  end
    assert_redirected_to sharks_url
  end
end
