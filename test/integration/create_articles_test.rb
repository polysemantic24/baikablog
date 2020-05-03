require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "pavel", email: "pavel@example.ru", password: "password", admin: true)
    @category =Category.create(name: "sports")  
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "New Title", description: "This is the description of the tilte", category_ids:[1]}}
      follow_redirect!
    end
    assert_template 'articles/show'
  end

end