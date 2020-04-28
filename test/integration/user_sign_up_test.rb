require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest

  test "get signup form and have user successfully signup" do 

    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do 
      post users_path, params: { user: { username: "janet doe", email: "janetdoe@example.com", password: "password" } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "janet doe", response.body
    
  end

end