require 'test_helper'

class ReunioesletrasControllerTest < ActionController::TestCase
  setup do
    @reuniaoletra = reunioesletras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reunioesletras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reuniaoletra" do
    assert_difference('Reuniaoletra.count') do
      post :create, reuniaoletra: { data: @reuniaoletra.data, nome: @reuniaoletra.nome }
    end

    assert_redirected_to reuniaoletra_path(assigns(:reuniaoletra))
  end

  test "should show reuniaoletra" do
    get :show, id: @reuniaoletra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reuniaoletra
    assert_response :success
  end

  test "should update reuniaoletra" do
    patch :update, id: @reuniaoletra, reuniaoletra: { data: @reuniaoletra.data, nome: @reuniaoletra.nome }
    assert_redirected_to reuniaoletra_path(assigns(:reuniaoletra))
  end

  test "should destroy reuniaoletra" do
    assert_difference('Reuniaoletra.count', -1) do
      delete :destroy, id: @reuniaoletra
    end

    assert_redirected_to reunioesletras_path
  end
end
