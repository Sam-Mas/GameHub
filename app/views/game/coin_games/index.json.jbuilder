json.array!(@game_coin_games) do |game_coin_game|
  json.extract! game_coin_game, :id
  json.url game_coin_game_url(game_coin_game, format: :json)
end
