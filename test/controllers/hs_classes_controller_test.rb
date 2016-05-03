require 'test_helper'

class HsClassesControllerTest < ActionController::TestCase
  setup do
    @hs_class = hs_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hs_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hs_class" do
    assert_difference('HsClass.count') do
      post :create, hs_class: { color: @hs_class.color, hero_power: @hs_class.hero_power, name: @hs_class.name }
    end

    assert_redirected_to hs_class_path(assigns(:hs_class))
  end

  test "should show hs_class" do
    get :show, id: @hs_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hs_class
    assert_response :success
  end

  test "should update hs_class" do
    patch :update, id: @hs_class, hs_class: { color: @hs_class.color, hero_power: @hs_class.hero_power, name: @hs_class.name }
    assert_redirected_to hs_class_path(assigns(:hs_class))
  end

  test "should destroy hs_class" do
    assert_difference('HsClass.count', -1) do
      delete :destroy, id: @hs_class
    end

    assert_redirected_to hs_classes_path
  end
end
