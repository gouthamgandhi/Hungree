require 'test_helper'

class MakeControllerTest < ActionController::TestCase
  test "should get budget" do
    get :budget
    assert_response :success
  end

  test "should get receipes" do
    get :receipes
    assert_response :success
  end

  test "should get groceries" do
    get :groceries
    assert_response :success
  end

end
