renewMyScores = (score) ->
 $('#my_score').text(score)

renewOpponentsScore = (score) ->
 $('#opponents_score').text(score)

gon.watch('my_score', interval: 5000, renewMyScores)
gon.watch('opponents_score', interval: 5000, renewOpponentsScore)
