require 'test_helper'

class ExitOrdersControllerTest < ActionController::TestCase
  setup do
    @exit_order = exit_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exit_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exit_order" do
    assert_difference('ExitOrder.count') do
      post :create, exit_order: { client_id: @exit_order.client_id, comments: @exit_order.comments, date: @exit_order.date, number: @exit_order.number }
    end

    assert_redirected_to exit_order_path(assigns(:exit_order))
  end

  test "should show exit_order" do
    get :show, id: @exit_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exit_order
    assert_response :success
  end

  test "should update exit_order" do
    patch :update, id: @exit_order, exit_order: { client_id: @exit_order.client_id, comments: @exit_order.comments, date: @exit_order.date, number: @exit_order.number }
    assert_redirected_to exit_order_path(assigns(:exit_order))
  end

  test "should destroy exit_order" do
    assert_difference('ExitOrder.count', -1) do
      delete :destroy, id: @exit_order
    end

    assert_redirected_to exit_orders_path
  end
end
