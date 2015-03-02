Rails.application.routes.draw do

	root 'welcome#index'
	post '/challenge_player', to: 'challengers#challenge_player'
	
	namespace :game do
		resources :coin_games 
	end

	resources :challengers

end
