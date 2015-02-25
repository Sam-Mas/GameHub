require 'test_helper'

class ChallengerTest < ActiveSupport::TestCase

	test "should properly save name and balance when creating a challenger" do
		challenger = Challenger.new(name: "Bob")
		assert_equal challenger.name, "Bob", "Challenger name not saved properly"
		assert_equal challenger.balance, 0.0, "Challenger default balance is not 0"
	end

    test "should not save challenger without a name" do
   		challenger = Challenger.new
   		assert_not challenger.save, "Saved a challenger without a name"
    end

    test "name should not be nil" do
    	challenger = Challenger.new(name: nil)
    	assert_not challenger.save, "Saved a challenger with nil name"
    end

end
