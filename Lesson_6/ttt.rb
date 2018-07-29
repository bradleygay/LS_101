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

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # Rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # Columns
                [[1, 5, 9], [3, 5, 7]] # Diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}): "
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "That is not a valid choice. Please choose again."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |arr|
    if brd.values_at(*arr).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*arr).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil # Nobody has won yet
end

loop do
  board = initialize_board

  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  # Break twice in order to prevent order of precedence confusion
  # While iterating over detect_winner method

  display_board(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Would you like to play again? (Y or N)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing. Goodbye."
