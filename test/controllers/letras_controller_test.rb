require 'test_helper'

class LetrasControllerTest < ActionController::TestCase
  setup do
    @letra = letras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:letras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create letra" do
    assert_difference('Letra.count') do
      post :create, letra: { arquivo: @letra.arquivo, cantor: @letra.cantor, letra: @letra.letra, nome: @letra.nome }
    end

    assert_redirected_to letra_path(assigns(:letra))
  end

  test "should show letra" do
    get :show, id: @letra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @letra
    assert_response :success
  end

  test "should update letra" do
    patch :update, id: @letra, letra: { arquivo: @letra.arquivo, cantor: @letra.cantor, letra: @letra.letra, nome: @letra.nome }
    assert_redirected_to letra_path(assigns(:letra))
  end

  test "should destroy letra" do
    assert_difference('Letra.count', -1) do
      delete :destroy, id: @letra
    end

    assert_redirected_to letras_path
  end
end
