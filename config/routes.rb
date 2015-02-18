Rails.application.routes.draw do

	root 'welcome#index'

	namespace :game do
		resources :coin_games 
	end

	resources :challengers

end
