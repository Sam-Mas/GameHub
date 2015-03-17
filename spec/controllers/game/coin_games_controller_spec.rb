require 'rails_helper'

RSpec.describe Game::CoinGamesController, type: :controller do

	context 'when getting the main coin game page' do
		it 'should get a list of all coin games' do
			get :index
			expect(assigns(:game_coin_games)).to eq(Game::CoinGame.all) 
			expect(response).to have_http_status(:success)
		end

		it 'should get a list of all full coin games' do
			get :index
			expect(assigns(:coin_games_full)).to eq(Game::CoinGame.all.find_all { |g| g.challengers.count == 2 }) 
			expect(response).to have_http_status(:success)
		end

		it 'should get a list of all coin games that need another player' do
			get :index
			expect(assigns(:coin_games_need_another_player)).to eq(Game::CoinGame.all.find_all { |g| g.challengers.count == 1 }) 
			expect(response).to have_http_status(:success)
		end
	end

	context 'GET show' do
		before(:each) do
			@game = Game::CoinGame.create!
		end

		it 'calls show with no errors' do
			allow(Game::CoinGame).to receive(:find) {@game}
			get :show, id: @game.id
			expect(response).to have_http_status(:success)
		end
	end
end
