require 'test_helper'

class ContactPeopleControllerTest < ActionController::TestCase
  setup do
    @contact_person = contact_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_person" do
    assert_difference('ContactPerson.count') do
      post :create, contact_person: { client_id: @contact_person.client_id, decision_maker: @contact_person.decision_maker, email: @contact_person.email, name: @contact_person.name, phone: @contact_person.phone, position: @contact_person.position }
    end

    assert_redirected_to contact_person_path(assigns(:contact_person))
  end

  test "should show contact_person" do
    get :show, id: @contact_person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_person
    assert_response :success
  end

  test "should update contact_person" do
    patch :update, id: @contact_person, contact_person: { client_id: @contact_person.client_id, decision_maker: @contact_person.decision_maker, email: @contact_person.email, name: @contact_person.name, phone: @contact_person.phone, position: @contact_person.position }
    assert_redirected_to contact_person_path(assigns(:contact_person))
  end

  test "should destroy contact_person" do
    assert_difference('ContactPerson.count', -1) do
      delete :destroy, id: @contact_person
    end

    assert_redirected_to contact_people_path
  end
end