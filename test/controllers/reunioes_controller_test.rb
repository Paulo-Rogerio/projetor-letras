require 'test_helper'

class ReunioesControllerTest < ActionController::TestCase
  setup do
    @reuniao = reunioes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reunioes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reuniao" do
    assert_difference('Reuniao.count') do
      post :create, reuniao: { arquivo: @reuniao.arquivo, dia_reuniao: @reuniao.dia_reuniao, palavra: @reuniao.palavra, predio_id: @reuniao.predio_id, preletor_id: @reuniao.preletor_id, publico: @reuniao.publico, resumo: @reuniao.resumo, tema_id: @reuniao.tema_id }
    end

    assert_redirected_to reuniao_path(assigns(:reuniao))
  end

  test "should show reuniao" do
    get :show, id: @reuniao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reuniao
    assert_response :success
  end

  test "should update reuniao" do
    patch :update, id: @reuniao, reuniao: { arquivo: @reuniao.arquivo, dia_reuniao: @reuniao.dia_reuniao, palavra: @reuniao.palavra, predio_id: @reuniao.predio_id, preletor_id: @reuniao.preletor_id, publico: @reuniao.publico, resumo: @reuniao.resumo, tema_id: @reuniao.tema_id }
    assert_redirected_to reuniao_path(assigns(:reuniao))
  end

  test "should destroy reuniao" do
    assert_difference('Reuniao.count', -1) do
      delete :destroy, id: @reuniao
    end

    assert_redirected_to reunioes_path
  end
end
