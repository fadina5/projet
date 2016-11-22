require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  setup do
    @city = cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city" do
    assert_difference('City.count') do
      VCR.use_cassette("nominatim1") do
       post :create, city: { lat: @city.lat, lon: @city.lon, name: @city.name }
      end
    end

    assert_redirected_to city_path(assigns(:city))
  end

  test "should show city" do
    VCR.use_cassette('weather') do
      get :show, id: @city
      assert_response :success
    end
  end

  test "should get edit" do
    get :edit, id: @city
    assert_response :success
  end

  test "should update city" do
    VCR.use_cassette("nominatim1") do
      patch :update, id: @city, city: { lat: @city.lat, lon: @city.lon, name: @city.name }
    end
    assert_redirected_to city_path(assigns(:city))
  end

  test "should destroy city" do
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to cities_path
  end
end
