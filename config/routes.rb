Rails.application.routes.draw do

	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :challengers
		end
	end

	root 'welcome#index'
	post '/challenge_player', to: 'challengers#challenge_player'
	
	namespace :game do
		resources :coin_games 
	end

	resources :challengers

end
