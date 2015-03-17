require 'rails_helper'

RSpec.describe Game::CoinGame, type: :model do

	context 'flip logic' do
		before :each do
			@guest = Challenger.create(name: "Bob")
			@game = Game::CoinGame.new
		end

		it "loads this test correctly" do
			expect(@game).to be_instance_of(Game::CoinGame)
		end

	end

end
