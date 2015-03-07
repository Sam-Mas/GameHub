require 'test_helper'

class ChallengersControllerTest < ActionController::TestCase

	setup do
		challenger = Challenger.new
		challenger.name = "Sammy"
		challenger.save
		cookies[:challenger_name] = challenger.name
		cookies[:challenger_id] = challenger.id
	end

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

	test "a new user should have a default balance of 500" do
		assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Tom'}
		end
		myChallenger = Challenger.find(cookies[:challenger_id]);
		assert_equal myChallenger.balance, 500
	
	end

	test "when creating a new challenger the balance should not be negative" do
      	assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Tom'}
		end
		myChallenger = Challenger.find(cookies[:challenger_id]);
      	assert_operator myChallenger.balance, :>=, 0, "Challenger balance is negative"
    end

    test "when creating a new challenger the balance should not be nil" do
      	assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Tom'}
		end
		myChallenger = Challenger.find(cookies[:challenger_id]);
      	assert_not_nil myChallenger.balance, "Challenger balance is nil"
    end

    test "when creating a new challenger the balance should be numeric" do
    	assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Tom'}
		end
		myChallenger = Challenger.find(cookies[:challenger_id]);
      	assert ((myChallenger.balance).is_a? Float), "Challenger balance is not a floating point number"
    end

    test "when creating a new challenger the balance should exist" do
    	assert_difference('Challenger.count') do
			post :create, challenger: {name: 'Tom'}
		end
		myChallenger = Challenger.find(cookies[:challenger_id]);
      	assert_not ((myChallenger.balance).nil?), "Challenger balance does not exist"
    end

end
