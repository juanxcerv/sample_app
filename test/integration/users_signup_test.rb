require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  #simulating visiting the sign up page 
  test 'invalid sign up information' do
    get signup_path
    #checks that user.count does not change after the block
    #is executed
    assert_no_difference 'User.count' do
      post users_path, user: {name: "", 
                      email: "user@invalid", 
                      password: "hihi",
                      password_confirmation: "hihih"}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test 'valid sign up information' do
    get signup_path
    #checks that user.count does not change after the block
    #is executed
    assert_difference 'User.count', 1 do
      post users_path, user: {name: "Example User", 
                      email: "user@valid.com", 
                      password: "password",
                      password_confirmation: "password"}
    end
    assert_template 'users/show'
    # assert_select 'div#error_explanation'
    # assert_select 'div.field_with_errors'
  end
  
end
