require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin = User.create(username: "quanle", email: "leminhquan8101998@gmail.com",
                              password: "password", admin: true)
    sign_in_as @admin
  end

  test "get new category form and create category" do
    get new_category_path
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: {name:"Sports"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end
  
  test "get new category form and reject invalid category" do
    get new_category_path
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: {name:""}}
    end
    assert_response :unprocessable_entity
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
