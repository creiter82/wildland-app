require 'test_helper'

class PersonnelQualificationsControllerTest < ActionController::TestCase
  setup do
    @personnel_qualification = personnel_qualifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personnel_qualifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personnel_qualification" do
    assert_difference('PersonnelQualification.count') do
      post :create, personnel_qualification: { personnel_id: @personnel_qualification.personnel_id, qualification_id: @personnel_qualification.qualification_id }
    end

    assert_redirected_to personnel_qualification_path(assigns(:personnel_qualification))
  end

  test "should show personnel_qualification" do
    get :show, id: @personnel_qualification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personnel_qualification
    assert_response :success
  end

  test "should update personnel_qualification" do
    patch :update, id: @personnel_qualification, personnel_qualification: { personnel_id: @personnel_qualification.personnel_id, qualification_id: @personnel_qualification.qualification_id }
    assert_redirected_to personnel_qualification_path(assigns(:personnel_qualification))
  end

  test "should destroy personnel_qualification" do
    assert_difference('PersonnelQualification.count', -1) do
      delete :destroy, id: @personnel_qualification
    end

    assert_redirected_to personnel_qualifications_path
  end
end
