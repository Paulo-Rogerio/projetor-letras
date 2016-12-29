require 'test_helper'

class RecadosControllerTest < ActionController::TestCase
  setup do
    @recado = recados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recado" do
    assert_difference('Recado.count') do
      post :create, recado: { data: @recado.data, interessado: @recado.interessado, recado: @recado.recado }
    end

    assert_redirected_to recado_path(assigns(:recado))
  end

  test "should show recado" do
    get :show, id: @recado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recado
    assert_response :success
  end

  test "should update recado" do
    patch :update, id: @recado, recado: { data: @recado.data, interessado: @recado.interessado, recado: @recado.recado }
    assert_redirected_to recado_path(assigns(:recado))
  end

  test "should destroy recado" do
    assert_difference('Recado.count', -1) do
      delete :destroy, id: @recado
    end

    assert_redirected_to recados_path
  end
end
