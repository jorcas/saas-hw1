# HW 1-2: Rock-Paper-Scissors
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

@debug = false
@testing = false
# game checking: R beats S; S beats P; and P beats R
def rps_result(m1, m2)
  valid_move = ["R", "P", "S"]
  game_checker = ["RS", "SP", "PR", "RR", "SS", "PP" ]
  move = m1[1].upcase + m2[1].upcase
  if @debug
  printf m1[0] + "(" + m1[1] + ") against " + m2[0] + "(" + m2[1] + ")"
  printf ",move:" + move
  end
  raise NoSuchStrategyError unless 
    valid_move.include?(m1[1].upcase) && 
    valid_move.include?(m2[1].upcase)
  if game_checker.include?(move) 
    if @debug ; printf ">" + m1[0] + " wins\n" ; end 
    return m1
  else
    if @debug ; printf ">" + m2[0] + " wins\n" ; end 
    return m2
  end
end

# Part A: Write a method rps_game_winner
def rps_game_winner(game)
  # check parameters
  raise WrongNumberOfPlayersError unless game.length == 2
  player1 = game[0]
  player2 = game[1]
  raise WrongNumberOfPlayersError unless 
    (player1.length == 2) && 
    (player2.length == 2)
  # play game
  return rps_result(player1, player2)
end

# Part B: We will define a rock-paper-scissors tournament 
def rps_tournament_winner(tournament)
  if tournament.flatten.length == 4
    return rps_game_winner(tournament)
  else
    if @debug ; puts "go inside" ; end 
    game1 = rps_tournament_winner(tournament[0])
    game2 = rps_tournament_winner(tournament[1])
    game = [ game1, game2 ]
    return rps_game_winner(game)
  end
end

if @testing
puts "game"
g=[ ["Armando", "p"], ["Dave", "s"] ]
puts rps_game_winner(g)

puts "tournament"
t=[
    [
        [ ["Armando", "P"], ["Dave", "S"] ],
        [ ["Richard", "R"],  ["Michael", "S"] ],
    ],
    [
        [ ["Allen", "S"], ["Omer", "P"] ],
        [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
]
puts rps_tournament_winner(t)
end

