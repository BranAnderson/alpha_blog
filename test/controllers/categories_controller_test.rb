require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do 
    get :index
    #Get the index page, and ensure that you successfully get the index page
    assert_response :success
  end

  test "should get new" do 
    get :new
    assert_response :success
  end

  test "should get show" do 
    get :show, params: {'id' => @category.id}
    assert_response :success
  end
  
end