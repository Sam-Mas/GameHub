class Challenger < ActiveRecord::Base
	validates :name, presence: true, allow_nil: false
	belongs_to :coingame
end
