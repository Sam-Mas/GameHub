require 'rails_helper'

RSpec.describe Game::CoinGame, type: :model do

	context 'all coin_game model tests: ' do
		before :each do #set up a dummy game
			@player1 = Challenger.create(name: "Bob")
			@player2 = Challenger.create(name: "Jim")
			@game = Game::CoinGame.new
			@game.challengers << @player1
			@game.challengers << @player2	
		end

		#############################################################################
		# This block is for tests that can be done when the game is started,
		# before either player has made a move. It includes status flags and
		# default values.
		#############################################################################
		context 'starting game state:' do
			it "generates a game object correctly" do
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

			it "checks player 1's score is zero at game start" do
				expect(@game.get_score_for(@player1.id)).to be == (0)
			end	

			it "checks player 2's score is zero at game start" do
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
			
			it "should allow the active player to flip a coin as 'Heads'" do
				expect(@game.flip_for(@player1.id, "Heads")).to be true
			end	

			it "should allow the active player to flip a coin as 'Tails'" do
				expect(@game.flip_for(@player1.id, "Heads")).to be true
			end		
			
			it "should not allow the active player to flip a coin as 'Xyzzy'" do
				expect(@game.flip_for(@player1.id, "Xyzzy")).to be nil
			end			
			
			it "should allow the active player to flip a coin" do
				allow(@game).to receive(:my_turn?) {true}
				allow(@game).to receive(:flip_coin) {"Heads"}
				allow(@game).to receive(:get_me) {@player1}
				expect(@game.flip_for(@player1.id, "Heads")).to be true
				expect(@game.last_flip_result).to eq("Heads!")
				expect(@game.last_guess).to eq(@player1.name + " guessed Heads")
				expect(@game.num_turns).to eq(9)
				expect(@game.score1).to eq(1)
			end				
			
		end # of context 'starting game state'
		
		#############################################################################
		# This block is for tests can that be observed while players are making moves
		#############################################################################
		
		context 'mid-game:' do
			it "should allow alternating turns to flip the coin" do
				expect(@game.flip_for(@player1.id, "Heads")).to be true
				expect(@game.flip_for(@player2.id, "Heads")).to be true
				expect(@game.flip_for(@player1.id, "Heads")).to be true
				expect(@game.flip_for(@player2.id, "Heads")).to be true
			end	
		
			it "should not allow multiple turns for the same player mid-game" do
				expect(@game.flip_for(@player1.id, "Heads")).to be true
				expect(@game.flip_for(@player2.id, "Heads")).to be true
				expect(@game.flip_for(@player2.id, "Heads")).to be nil
				expect(@game.flip_for(@player1.id, "Heads")).to be true
			end		
		
			it "should adjust someone's score after a round" do
				expect(@game.get_score_for(@player1.id) + @game.get_score_for(@player2.id) == (0))
				@game.flip_for(@player1.id, "Heads")
				expect(@game.get_score_for(@player1.id) + @game.get_score_for(@player2.id) != (0))
			end
			
			it "should report whose turn it is after each turn" do
				expect(@game.my_turn?(@player1.id)).to be true #round 1
				expect(@game.my_turn?(@player2.id)).to be false
				@game.flip_for(@player1.id, "Heads")
				expect(@game.my_turn?(@player1.id)).to be false #round 2
				expect(@game.my_turn?(@player2.id)).to be true
				@game.flip_for(@player2.id, "Heads")
				expect(@game.my_turn?(@player1.id)).to be true #round 3
				expect(@game.my_turn?(@player2.id)).to be false
			end
		end
		
		#############################################################################
		# This block is for endgame after forcing 10 moves
		#############################################################################
		context 'end-game:' do
			before :each do #set up a dummy game
				@game.flip_for(@player1.id, "Heads")# 10 rounds
				@game.flip_for(@player2.id, "Heads")
				@game.flip_for(@player1.id, "Heads")
				@game.flip_for(@player2.id, "Heads")
				@game.flip_for(@player1.id, "Heads")
				@game.flip_for(@player2.id, "Heads")
				@game.flip_for(@player1.id, "Heads")
				@game.flip_for(@player2.id, "Heads")
				@game.flip_for(@player1.id, "Heads")
				@game.flip_for(@player2.id, "Heads") 
			end

			it "should correctly report the game as finished" do
				expect(@game.done?).to be true
			end		
			
			it "should total to ten points at the end of the game" do
				expect(@game.get_score_for(@player1.id) + @game.get_score_for(@player2.id) == (10))
			end	
			
			it "should not allow for moves after the game is over" do
				expect(@game.flip_for(@player1.id, "Heads")).to be nil # move 11 of 10
			end		
		end
		#############################################################################
		# This block is for endgame regardless of moves
		#############################################################################
		context 'end-game:' do
			it "should declare player1 the winner if player1 has the higher score" do
				@game.score1 = 10
				@game.score2 = 0
				expect(@game.finished_message(@player1.id)).to eq("You Won!")
			end

			it "should declare player1 the loser if player1 has the lower score" do
				@game.score1 = 0
				@game.score2 = 10
				expect(@game.finished_message(@player1.id)).to eq("You Lost!")
			end
			
			it "should declare player2 the winner if player2 has the higher score" do
				@game.score1 = 0
				@game.score2 = 10
				expect(@game.finished_message(@player2.id)).to eq("You Won!")
			end
			
			it "should declare player2 the loser if player2 has the lower score" do
				@game.score1 = 10
				@game.score2 = 0
				expect(@game.finished_message(@player2.id)).to eq("You Lost!")
			end

			it "should declare a tie to player 1 if both players have the same score" do
				@game.score1 = 5
				@game.score2 = 5
				expect(@game.finished_message(@player1.id)).to eq("It's a Tie!")
			end
			
			it "should declare a tie to player 2 if both players have the same score" do
				@game.score1 = 5
				@game.score2 = 5
				expect(@game.finished_message(@player2.id)).to eq("It's a Tie!")
			end		
			
		end
	end
end
