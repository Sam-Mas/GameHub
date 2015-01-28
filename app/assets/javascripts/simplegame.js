function simplegame(guess) 
{
	var x = Math.random()
	var flip_result
	var response_to_player
	
	if (x < 0.5)
		flip_result = "Heads!"
	else
		flip_result = "Tails!"
	
	if (flip_result == guess)
		response_to_player = flip_result + " Win!"
	else
		response_to_player = flip_result + " Lose..."
	
	document.getElementById("coin_result").innerHTML = response_to_player;
}