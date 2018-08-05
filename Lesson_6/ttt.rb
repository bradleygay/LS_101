# We want to build a single player Tic Tac Toe game
# where a user can play against the computer.

# Sequence of Gameplay
# => 1  Display 3x3 Board
# => 2  Ask User to Mark Square
# => 3  Computer Marks Square
# => 4  Display Updated 3x3 Board (Inspect)
# => 5  If Winner, Display Winner
# => 6  If Board is Full, Display Tie
# => 7  If Neither, Loop again; Ask User to Mark Square (Go to 2)
# => 8  Play Again?
# => 9  User Input; If Yes, Loop again; Display 3x3 Board (Go to 1)
# => 10 User Input; If No, Goodbye!

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # Rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # Columns
                [[1, 5, 9], [3, 5, 7]] # Diagonals
FIRST_PLAYER = 'Choose'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Welcome to Tic-Tac-Toe."
  puts "You are #{PLAYER_MARKER}'s. The computer is #{COMPUTER_MARKER}'s."
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 1
    arr.join
  when 2
    "#{arr[0]} #{word} #{arr[1]}"
  when 3..9
    arr[-1] = "#{word} #{arr.last} "
    arr.join(delimiter)
  end
end

def who_plays_first
  prompt "Please determine who goes first; the computer (c) or the player (p)."
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if ['p', 'player', 'c', 'computer'].include?(answer)
    prompt "Please pick again: 'p' for player or 'c' for computer."
  end
  case answer
  when 'p' then 'Player'
  when 'c' then 'Computer'
  end
end

def first_player_assignment
  case FIRST_PLAYER
  when 'Player' then 'Player'
  when 'Computer' then 'Computer'
  when 'Choose' then who_plays_first
  end
end

def next_player(current_player)
  case current_player
  when 'Player' then 'Computer'
  when 'Computer' then 'Player'
  end
end

def center_square(brd)
  5 if brd[5] == INITIAL_MARKER
end

def random_square(brd)
  empty_squares(brd).sample
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "That is not a valid choice. Please choose again."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  # Offense
  move = attack(brd)
  # Defense
  move = defend(brd) unless move
  # Square Five Available?
  move = center_square(brd) unless move
  # Random
  move = random_square(brd) unless move
  brd[move] = COMPUTER_MARKER
end

def attack(brd)
  best_play(brd, COMPUTER_MARKER)
end

def defend(brd)
  best_play(brd, PLAYER_MARKER)
end

def best_play(brd, marker)
  WINNING_LINES.each do |arr|
    if brd.values_at(arr[0], arr[1], arr[2]).count(marker) == 2 &&
       brd.values_at(arr[0], arr[1], arr[2]).count(INITIAL_MARKER) == 1
      then arr.select do |square|
        return square if empty_squares(brd).include?(square)
      end
    end
    next
  end
  nil
end

def computer_ai(arr, brd, mark)
  if brd.values_at(arr[0], arr[1], arr[2]).count(mark) == 2
    brd.select { |k, v| arr.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player' then player_places_piece!(brd)
  when 'Computer' then computer_places_piece!(brd)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |arr|
    if brd.values_at(arr[0], arr[1], arr[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(arr[0], arr[1], arr[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil # Nobody has won yet
end

def enter_to_continue
  prompt "Please press <Enter> to continue."
  gets.chomp
end

def play_again?
  prompt "Would you like to play again? (Y or N)"
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    return false
  elsif answer.downcase.start_with?('n')
    return true
  else
    prompt "Invalid input. Please enter 'y' or 'n' to continue."
  end
  play_again?
end

#-------------

loop do
  player_wins = 0
  computer_wins = 0
  board = initialize_board
  display_board(board)
  first_player = first_player_assignment
  loop do
    board = initialize_board
    current_player = first_player
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = next_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "Stalemate."
    end

    if detect_winner(board) == 'Player'
      player_wins += 1
    end
    if detect_winner(board) == 'Computer'
      computer_wins += 1
    end
    prompt "The score is: Player #{player_wins}, Computer #{computer_wins}"
    enter_to_continue

    if player_wins == 5 || computer_wins == 5
      prompt ">> GAME OVER <<"
      if player_wins == 5
        prompt "You Won!"
      else
        prompt "The Computer Won."
      end
      break
    end
  end

  break if play_again?
end

prompt "Thanks for playing. Goodbye."
