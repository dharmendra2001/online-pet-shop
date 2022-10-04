require "test_helper"

class PetshopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get petshops_index_url
    assert_response :success
  end

  test "should get show" do
    get petshops_show_url
    assert_response :success
  end
end
