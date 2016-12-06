require 'test_helper'

class HelloModelsControllerTest < ActionController::TestCase
  setup do
    @hello_model = hello_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hello_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hello_model" do
    assert_difference('HelloModel.count') do
      post :create, hello_model: { hellotext: @hello_model.hellotext, uptime: @hello_model.uptime }
    end

    assert_redirected_to hello_model_path(assigns(:hello_model))
  end

  test "should show hello_model" do
    get :show, id: @hello_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hello_model
    assert_response :success
  end

  test "should update hello_model" do
    patch :update, id: @hello_model, hello_model: { hellotext: @hello_model.hellotext, uptime: @hello_model.uptime }
    assert_redirected_to hello_model_path(assigns(:hello_model))
  end

  test "should destroy hello_model" do
    assert_difference('HelloModel.count', -1) do
      delete :destroy, id: @hello_model
    end

    assert_redirected_to hello_models_path
  end
end
