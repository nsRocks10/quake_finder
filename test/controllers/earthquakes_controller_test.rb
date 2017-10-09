require 'test_helper'

class EarthquakesControllerTest < ActionController::TestCase
  test '#index' do
  	query_params = {
  		latitude: '34.25',
  		longitude: '-115.25',
  		start_date: '2017-10-08',
  		end_date: ''
  	}

    get :index, query_params

    assert_response :success
  end
end
