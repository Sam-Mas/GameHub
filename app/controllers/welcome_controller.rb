class WelcomeController < ApplicationController
  def index
	  @challenger = Challenger.new
	  @challengers = Challenger.all
  end
end
