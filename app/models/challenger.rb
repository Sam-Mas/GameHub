class Challenger < ActiveRecord::Base
	validates :name, presence: true, allow_nil: false, format: { with: /\A[a-zA-Z0-9]+\Z/ }
	belongs_to :coingame
end
