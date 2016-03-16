require 'test_helper'

class RefundClaimsControllerTest < ActionController::TestCase
  setup do
    @refund_claim = refund_claims(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refund_claims)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refund_claim" do
    assert_difference('RefundClaim.count') do
      post :create, refund_claim: {  }
    end

    assert_redirected_to refund_claim_path(assigns(:refund_claim))
  end

  test "should show refund_claim" do
    get :show, id: @refund_claim
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refund_claim
    assert_response :success
  end

  test "should update refund_claim" do
    patch :update, id: @refund_claim, refund_claim: {  }
    assert_redirected_to refund_claim_path(assigns(:refund_claim))
  end

  test "should destroy refund_claim" do
    assert_difference('RefundClaim.count', -1) do
      delete :destroy, id: @refund_claim
    end

    assert_redirected_to refund_claims_path
  end
end
