require 'test_helper'

class ChallengersControllerTest < ActionController::TestCase

	test "should get new" do
		get :new
		assert_response :success, "response was not successfull"
		assert_not_nil assigns(:challenger), "challeneger was set to nil"
	end

	test "should create new user" do
		assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end

		assert_equal cookies[:challenger_name], 'Sam', "No cookie with specifed name"
		assert_redirected_to root_path, "Not redirected to root_path"
	end

	test "should create new user only once" do
		assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end
		assert_no_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end

		assert_equal cookies[:challenger_name], 'Sam',"No Cookie by the name of Sam"
		assert_redirected_to root_path
	end

end
