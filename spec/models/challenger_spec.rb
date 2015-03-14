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

end
