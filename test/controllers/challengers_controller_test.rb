require 'test_helper'

class ChallengersControllerTest < ActionController::TestCase

	test "should get new" do
		get :new
		assert_response :success
		assert_not_nil assigns(:challenger)
	end

	test "should create new user" do
		assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end

		assert_equal(cookies[:challenger_name], 'Sam')
		assert_redirected_to root_path
	end

	test "should create new user only once" do
		assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end
		assert_no_difference('Challenger.count') do
			post :create, challenger: {name: 'Sam'}
		end

		assert_equal(cookies[:challenger_name], 'Sam')
		assert_redirected_to root_path
	end

end
