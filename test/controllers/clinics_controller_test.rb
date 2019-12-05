require 'test_helper'

class ClinicsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get clinics_edit_url
    assert_response :success
  end

  test "should get update" do
    get clinics_update_url
    assert_response :success
  end

end
