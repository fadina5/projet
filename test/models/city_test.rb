require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test "invalid city" do
    VCR.use_cassette("nominatim2") do
      incorrect = City.new name: cities(:two).name
      assert incorrect.invalid?
    end
  end
  
  test "valid city" do
    VCR.use_cassette("nominatim1") do
      incorrect = City.new name: cities(:one).name
      assert incorrect.valid?
    end
  end
  
  test 'weather forecast' do 
     VCR.use_cassette("weather") do
       weather = cities(:one).weather
       assert weather == 'rain'
     end
  end
  
    test 'weather forecast unknown city' do 
     VCR.use_cassette("weather2") do
       weather = cities(:two).weather
       assert weather == "unknown"
     end
  end
end
