require 'test_helper'

class TravelPlansControllerTest < ActionController::TestCase
  setup do
    @travel_plan = travel_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travel_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel_plan" do
    assert_difference('TravelPlan.count') do
      post :create, travel_plan: {  }
    end

    assert_redirected_to travel_plan_path(assigns(:travel_plan))
  end

  test "should show travel_plan" do
    get :show, id: @travel_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @travel_plan
    assert_response :success
  end

  test "should update travel_plan" do
    patch :update, id: @travel_plan, travel_plan: {  }
    assert_redirected_to travel_plan_path(assigns(:travel_plan))
  end

  test "should destroy travel_plan" do
    assert_difference('TravelPlan.count', -1) do
      delete :destroy, id: @travel_plan
    end

    assert_redirected_to travel_plans_path
  end
end
