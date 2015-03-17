require 'rails_helper'

RSpec.describe Game::CoinGame, type: :model do

	context 'starting game state:' do
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
		
		it "returns player1 based on player1's id" do
			expect(@game.get_me(@player1.id)).to be == (@player1)
		end
		
		it "returns player2 based on player2's id" do
			expect(@game.get_me(@player2.id)).to be == (@player2)
		end

		it "returns player2 based on player1's id" do
			expect(@game.get_opponent(@player1.id)).to be == (@player2)
		end
		
		it "returns player1 based on player2's id" do
			expect(@game.get_opponent(@player2.id)).to be == (@player1)
		end		

		it "checks player 1's score at game start" do
			expect(@game.get_score_for(@player1.id)).to be == (0)
		end	

		it "checks player 2's score at game start" do
			expect(@game.get_score_for(@player2.id)).to be == (0)
		end	
			
		it "should declare a tie if the game immediately ends" do
			expect(@game.finished_message(@player1.id)).to eq("It's a Tie!")
		end

		it "should declare a tie if the game immediately ends" do
			expect(@game.finished_message(@player2.id)).to eq("It's a Tie!")
		end
		
		it "should be player1's turn at game start" do
			expect(@game.my_turn?(@player1.id)).to be true
		end
		
		it "should not be player2's turn at game start" do
			expect(@game.my_turn?(@player2.id)).to be false
		end		
		
		it "should not allow the inactive player to flip a coin" do
			expect(@game.flip_for(@player2.id, "Heads")).to be nil
		end
		
		it "should allow the active player to flip a coin" do
			expect(@game.flip_for(@player1.id, "Heads")).to be true
		end		
	end # of context 'starting game state'

end
