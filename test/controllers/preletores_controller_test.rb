require 'test_helper'

class PreletoresControllerTest < ActionController::TestCase
  setup do
    @preletor = preletores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:preletores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preletor" do
    assert_difference('Preletor.count') do
      post :create, preletor: { funcao: @preletor.funcao, nome: @preletor.nome, predio_id: @preletor.predio_id }
    end

    assert_redirected_to preletor_path(assigns(:preletor))
  end

  test "should show preletor" do
    get :show, id: @preletor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @preletor
    assert_response :success
  end

  test "should update preletor" do
    patch :update, id: @preletor, preletor: { funcao: @preletor.funcao, nome: @preletor.nome, predio_id: @preletor.predio_id }
    assert_redirected_to preletor_path(assigns(:preletor))
  end

  test "should destroy preletor" do
    assert_difference('Preletor.count', -1) do
      delete :destroy, id: @preletor
    end

    assert_redirected_to preletores_path
  end
end
