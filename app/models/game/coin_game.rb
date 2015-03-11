class Game::CoinGame < ActiveRecord::Base

	validates :score1, presence: true, allow_nil: false
	validates :score2, presence: true, allow_nil: false
	has_many :challengers, before_add: :check_challengers_limit

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

	def check_if_player_done(challenger_id)

		done = false

		if self.challengers.first.id == challenger_id

			if self.player1done == true
				done = true
			end
		elsif self.challengers.last.id == challenger_id
			if self.player2done == true
				done = true
			end
		end

		return done
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

	private 
	def check_challengers_limit(challenger)
		if self.challengers.size >= Game::CoinGame.MAX_SIZE
			raise "Can't add another challenger to this game"
		end
	end

	def self.MAX_SIZE
		2
	end
end
