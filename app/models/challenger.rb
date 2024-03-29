class Challenger < ActiveRecord::Base

	PAD_WITH = '0'
	GUEST_DIGIT_MAX = 6
	UP_TO_NUMBER_OF_GUESTS = 10 ** GUEST_DIGIT_MAX

	validates :name, presence: true, uniqueness: true, allow_nil: false, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { maximum: 30 }
	validates :balance, presence: true, uniqueness: false, allow_nil: false, length: { maximum: 10 }
	validates :token, allow_nil: true, uniqueness: true, length: { is: GUEST_DIGIT_MAX }, format: { with: /\A\d+\Z/ }
	validate :validate_guest_have_token

	belongs_to :coingame

	# class  methods

	def self.create_guest
		guest = Challenger.new

		# create a unique token for each Guest
		guest.create_guest_name

		guest.save

		# return guest (it's the ruby way not to say return)
		guest
	end

	# instance methods

	def create_guest_name
		unless name
			generate_token
			self.name = "Guest" + self.token
		end
	end

	private

	def generate_token
		self.token = loop do
			random_token = SecureRandom.random_number(UP_TO_NUMBER_OF_GUESTS).to_s.rjust(GUEST_DIGIT_MAX, PAD_WITH)
			break random_token unless self.class.exists?(token: random_token)
		end
	end

	def validate_guest_have_token
		unless guest_have_token
			errors.add(:name, "Guest must have a token that is padded onto the end")
		end
	end

	def guest_have_token
		result = true
		if !self.name.nil? && self.name.start_with?("Guest")
			result = !self.token.nil? && self.name.end_with?(self.token)
		end
		result
	end

end
