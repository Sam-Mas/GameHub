require 'rails_helper'

RSpec.describe Game::CoinGame, type: :model do

	context 'flip logic' do
		before :each do #set up a dummy game
			@player1 = Challenger.create(name: "Bob")
			@player2 = Challenger.create(name: "Jim")
			@game = Game::CoinGame.new
			@game.challengers << @player1
			@game.challengers << @player2
		end

		it "loads this test correctly" do
			expect(@game).to be_instance_of(Game::CoinGame)
		end

		it "checks if the game is active once created" do
			expect(@game.done?()).to be false
		end
		
		it "checks player 1's self-identity" do
			expect(@game.get_me(@player1.id)).to be == (@player1)
		end
		
		it "checks player 2's self-identity" do
			expect(@game.get_me(@player2.id)).to be == (@player2)
		end

		it "checks player 1's opponent's identity" do
			expect(@game.get_opponent(@player1.id)).to be == (@player2)
		end
		
		it "checks player 2's opponent's identity" do
			expect(@game.get_opponent(@player2.id)).to be == (@player1)
		end		



			
		

		

	end

end
