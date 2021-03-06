require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:omar)
    @non_admin= users(:archer)
  end
  
   test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    # assert_select 'div.pagination' (unnecessary cause there are <30 users)
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end
  
  test "logging in as admin shows index" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
  end
  
  test "logging in as non-admin hides index" do
    log_in_as(@non_admin)
    assert_select 'a[href=?]', users_path, count: 0
  end
  

  
end
