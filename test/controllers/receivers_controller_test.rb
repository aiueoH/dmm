require 'test_helper'

class ReceiversControllerTest < ActionController::TestCase
  setup do
    @receiver = receivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiver" do
    assert_difference('Receiver.count') do
      post :create, receiver: { comment: @receiver.comment, contact: @receiver.contact, name: @receiver.name, phone: @receiver.phone }
    end

    assert_redirected_to receiver_path(assigns(:receiver))
  end

  test "should show receiver" do
    get :show, id: @receiver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receiver
    assert_response :success
  end

  test "should update receiver" do
    patch :update, id: @receiver, receiver: { comment: @receiver.comment, contact: @receiver.contact, name: @receiver.name, phone: @receiver.phone }
    assert_redirected_to receiver_path(assigns(:receiver))
  end

  test "should destroy receiver" do
    assert_difference('Receiver.count', -1) do
      delete :destroy, id: @receiver
    end

    assert_redirected_to receivers_path
  end
end
