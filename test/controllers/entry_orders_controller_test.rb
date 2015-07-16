require 'test_helper'

class EntryOrdersControllerTest < ActionController::TestCase
  setup do
    @entry_order = entry_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entry_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry_order" do
    assert_difference('EntryOrder.count') do
      post :create, entry_order: { client_id: @entry_order.client_id, comments: @entry_order.comments, date: @entry_order.date, number: @entry_order.number }
    end

    assert_redirected_to entry_order_path(assigns(:entry_order))
  end

  test "should show entry_order" do
    get :show, id: @entry_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry_order
    assert_response :success
  end

  test "should update entry_order" do
    patch :update, id: @entry_order, entry_order: { client_id: @entry_order.client_id, comments: @entry_order.comments, date: @entry_order.date, number: @entry_order.number }
    assert_redirected_to entry_order_path(assigns(:entry_order))
  end

  test "should destroy entry_order" do
    assert_difference('EntryOrder.count', -1) do
      delete :destroy, id: @entry_order
    end

    assert_redirected_to entry_orders_path
  end
end
