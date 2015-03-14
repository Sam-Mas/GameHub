require 'rails_helper'

RSpec.describe Challenger, type: :model do

	context 'when creating a guest' do
		before :each do
			@guest = Challenger.create_guest
		end

		it "has a Challenger is returned" do
			expect(@guest).to be_instance_of(Challenger)
		end

		it "has the word 'Guest' in its name" do
			expect(@guest.name).to start_with("Guest")
		end

		it "has a token from 0 <= to < 10000000" do
			expect(@guest.token.to_i).to be_between(0, 10 ** 6).inclusive
		end

		it "has its token at the end" do
			expect(@guest.name).to end_with(@guest.token.to_s.rjust(6, '0'))
		end
	end

	context 'when giving a guest name' do
		before :each do
			@guest = Challenger.new
			@guest.create_guest_name
		end

		it "has the word 'Guest' in its name" do
			expect(@guest.name).to start_with("Guest")
		end

		it "has a token from 0 <= to < 10000000" do
			expect(@guest.token.to_i).to be_between(0, 10 ** 7).inclusive
		end

		it "has its token at the end" do
			expect(@guest.name).to end_with(@guest.token.to_s.rjust(6, '0'))
		end
	end

	context 'when using the token column' do
		before :each do
			@challenger = Challenger.new
			@challenger.name = "Guest"
		end

		it "can't have a null token with a 'Guest' user name" do
			expect(@challenger.save).to be false
		end

		it "can have a null token with a non 'Guest' user name" do
			@challenger2 = Challenger.new
			@challenger2.name = "Sam" 
			expect(@challenger2.save).to be true
		end

		it 'must be a number of length GUEST_DIGIT_MAX' do
			@challenger.token = "123456"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be true

			@challenger.token = "12345"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be false

			@challenger.token = "1234567"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be false
		end

		it 'must be a number' do
			@challenger.token = "123456"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be true

			@challenger.token = "abcdef"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be false

			@challenger.token = "123a56"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be false
		end

		it 'must be unique' do
			@challenger.token = "123456"
			@challenger.name = "Guest" + @challenger.token
			expect(@challenger.save).to be true

			@challenger2 = Challenger.new
			@challenger2.token = "123456"
			@challenger2.name = "Guest" + @challenger2.token
			expect(@challenger2.save).to be false
		end

		it 'must have its name end with the token string' do
			@challenger.token = "111111"
			@challenger.name = "Guest" + "111111"
			expect(@challenger.save).to be true

			@challenger.token = "111111"
			@challenger.name = "Guest" + "999999"
			expect(@challenger.save).to be false
		end
	end

end
