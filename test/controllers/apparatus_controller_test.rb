require 'test_helper'

class ApparatusControllerTest < ActionController::TestCase
  setup do
    @apparatu = apparatus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apparatus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apparatu" do
    assert_difference('Apparatu.count') do
      post :create, apparatu: { name: @apparatu.name }
    end

    assert_redirected_to apparatu_path(assigns(:apparatu))
  end

  test "should show apparatu" do
    get :show, id: @apparatu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apparatu
    assert_response :success
  end

  test "should update apparatu" do
    patch :update, id: @apparatu, apparatu: { name: @apparatu.name }
    assert_redirected_to apparatu_path(assigns(:apparatu))
  end

  test "should destroy apparatu" do
    assert_difference('Apparatu.count', -1) do
      delete :destroy, id: @apparatu
    end

    assert_redirected_to apparatus_path
  end
end
