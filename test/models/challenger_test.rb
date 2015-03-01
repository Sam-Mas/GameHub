require 'test_helper'

class ChallengerTest < ActiveSupport::TestCase

    test "should properly save name and balance when creating a challenger" do
            challenger = Challenger.new(name: "Bob")
            assert_equal challenger.name, "Bob", "Challenger name not saved properly"
            assert_equal challenger.balance, 500.0, "Challenger default balance is not 500"
    end

    test "should not save challenger without a name" do
   		challenger = Challenger.new
   		assert_not challenger.save, "Saved a challenger without a name"
    end

    test "name should not be nil" do
    	challenger = Challenger.new(name: nil)
    	assert_not challenger.save, "Saved a challenger with nil name"
    end

    test "name should not be empty" do
      challenger = Challenger.new(name: "")
      assert_not challenger.save, "Saved a challenger with an empty name"
    end

    test "name should not contain spaces" do
      challenger = Challenger.new(name: "Bob Fredrick")
      assert_not challenger.save, "Saved a challenger with spaces in the name"
    end

    test "name should not contain special characters" do
      challenger = Challenger.new(name: "Bob&%#")
      assert_not challenger.save, "Saved a challenger with spaces in the name"
    end

    test "when creating a challenger the balance should not be negative" do
      challenger = Challenger.new(name: "Tom")
      assert_equal challenger.name, "Tom", "Challenger name not saved properly"
      assert_operator challenger.balance, :>=, 0, "Challenger balance is negative"
    end

    test "when creating a challenger the balance should not be nil" do
      challenger = Challenger.new(name: "Tom")
      assert_not_nil challenger.balance, "Challenger balance is nil"
    end

    test "when creating a challenger the balance should be numeric" do
      challenger = Challenger.new(name: "Tom")
      assert ((challenger.balance).is_a? Float), "Challenger balance is not a floating point number"
    end

    test "when creating a challenger the balance should exist" do
      challenger = Challenger.new(name: "Tom")
      assert_not ((challenger.balance).nil?), "Challenger balance does not exist"
    end

    test "when creating a challenger the balance should have a default value" do
      challenger = Challenger.new(name: "Tom")
      assert_equal challenger.balance, 500.0, "Challenger balance is not the default"
    end

end
