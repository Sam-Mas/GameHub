class Game::CoinGame < ActiveRecord::Base

	validates :score1, presence: true, allow_nil: false
	validates :score2, presence: true, allow_nil: false
	has_many :challengers, before_add: :check_challengers_limit

	def flip_for(challenger_id, guess)

		if (my_turn?(challenger_id.to_i)) 
			flip = flip_coin

			# if the right guess
			if flip == guess 
				add_a_win_for(challenger_id.to_i)
			else
				opponent = get_opponent(challenger_id)
				add_a_win_for(opponent.id.to_i)
			end

			self.last_flip_result = flip + "!"
			self.last_guess = get_me(challenger_id).name + " guessed " + guess
			self.num_turns = self.num_turns - 1
			mark_board(challenger_id)
			end_turn(challenger_id)
		end

		save

	end

	def my_turn?(challenger_id)
		return  ( self.challengers.first.id == challenger_id && self.player_1_turn ) ||
				( self.challengers.last.id == challenger_id && !self.player_1_turn )
	end

	def done?
		self.num_turns <= 0
	end

	def finished_message(challenger_id)

		if i_win?(challenger_id)
			message = "You Won!"
		elsif tie?
			message = "It's a Tie!"
		else
			message = "You Lost!"
		end

		return message

	end
	
	def get_score_for(challenger_id)
	
		score = 0

		if self.challengers.first.id == challenger_id
			score = self.score1 
		elsif self.challengers.last.id == challenger_id
			score = self.score2 
		end

		return score

	end

	def get_opponent(challenger_id)
		self.challengers.find { |c| c.id != challenger_id.to_i }
	end

	def get_me(challenger_id)
		self.challengers.find { |c| c.id == challenger_id.to_i }
	end


	private 


	def check_challengers_limit(challenger)
		if self.challengers.size >= Game::CoinGame.MAX_SIZE
			raise "Can't add another challenger to this game"
		end
	end

	def add_a_win_for(challenger_id)
		if self.challengers.first.id == challenger_id
			self.score1 += 1
		elsif self.challengers.last.id == challenger_id
			self.score2 += 1
		end
	end

	def mark_board(challenger_id)
		if self.challengers.first.id == challenger_id
			self.player1done = true
		elsif self.challengers.last.id == challenger_id
			self.player2done = true
		end
	end

	def end_turn(challenger_id)
		self.player_1_turn = self.challengers.first.id != challenger_id.to_i
	end

	def i_win?(challenger_id)
		return ( self.challengers.first.id == challenger_id.to_i && self.score1 > self.score2 ) ||
				( self.challengers.last.id == challenger_id.to_i && self.score1 < self.score2 )
	end

	def tie?
		return self.score1 == self.score2
	end

	def flip_coin
		# This decides the outcome of the filp
		choices = ["Tails", "Heads"]
		return choices[rand(0..1)]
	end

	def self.MAX_SIZE
		2
	end
end
