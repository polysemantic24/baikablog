require 'test_helper'

class CreateUsersTest < ActionDispatch::IntegrationTest

  test "get new user form and create user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "pavel", email: "pavel@example.ru", password: "password"}}
    end
    assert_template 'users/show'
    assert_match "pavel", response.body
  end

end