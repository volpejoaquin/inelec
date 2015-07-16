require 'test_helper'

class TransformersControllerTest < ActionController::TestCase
  setup do
    @transformer = transformers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transformers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transformer" do
    assert_difference('Transformer.count') do
      post :create, transformer: { comments: @transformer.comments, diagnostic: @transformer.diagnostic, entry_order_id: @transformer.entry_order_id, exit_order_id: @transformer.exit_order_id, mark: @transformer.mark, number: @transformer.number, power: @transformer.power, record_id: @transformer.record_id }
    end

    assert_redirected_to transformer_path(assigns(:transformer))
  end

  test "should show transformer" do
    get :show, id: @transformer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transformer
    assert_response :success
  end

  test "should update transformer" do
    patch :update, id: @transformer, transformer: { comments: @transformer.comments, diagnostic: @transformer.diagnostic, entry_order_id: @transformer.entry_order_id, exit_order_id: @transformer.exit_order_id, mark: @transformer.mark, number: @transformer.number, power: @transformer.power, record_id: @transformer.record_id }
    assert_redirected_to transformer_path(assigns(:transformer))
  end

  test "should destroy transformer" do
    assert_difference('Transformer.count', -1) do
      delete :destroy, id: @transformer
    end

    assert_redirected_to transformers_path
  end
end
