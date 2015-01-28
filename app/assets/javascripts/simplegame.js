function simplegame() 
{
	var x = Math.random()
	var y
	
	if (x < 0.5)
		y = "Heads!"
	else
		y = "Tails!"
	
	document.getElementById("coin_result").innerHTML = y;
}