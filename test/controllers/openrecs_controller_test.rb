require 'test_helper'

class OpenrecsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @openrec = openrecs(:one)
  end

  test "should get index" do
    get openrecs_url
    assert_response :success
  end

  test "should get new" do
    get new_openrec_url
    assert_response :success
  end

  test "should create openrec" do
    assert_difference('Openrec.count') do
      post openrecs_url, params: { openrec: { body: @openrec.body, name: @openrec.name, openrec_url: @openrec.openrec_url, user_id: @openrec.user_id } }
    end

    assert_redirected_to openrec_url(Openrec.last)
  end

  test "should show openrec" do
    get openrec_url(@openrec)
    assert_response :success
  end

  test "should get edit" do
    get edit_openrec_url(@openrec)
    assert_response :success
  end

  test "should update openrec" do
    patch openrec_url(@openrec), params: { openrec: { body: @openrec.body, name: @openrec.name, openrec_url: @openrec.openrec_url, user_id: @openrec.user_id } }
    assert_redirected_to openrec_url(@openrec)
  end

  test "should destroy openrec" do
    assert_difference('Openrec.count', -1) do
      delete openrec_url(@openrec)
    end

    assert_redirected_to openrecs_url
  end
end
