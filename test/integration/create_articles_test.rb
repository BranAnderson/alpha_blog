require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
  end

  test "get new article form and successfully submit article" do 
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do 
      post articles_path, params: { article: { title: "New Article", description: "New articles description" } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "New Article", response.body
    
  end

end