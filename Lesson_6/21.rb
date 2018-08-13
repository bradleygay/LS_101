# We want to build a single game of Blackjack
# Player (User) v. Dealer (Computer)

# Sequence of Gameplay
# => 1 Display Welcome
# => 2 Ready to Play?
# => 3 Computer Deals to User and Computer
# => 4 Evaluate Hands
# => 5 User: Hit or Stay?
# => 6 If Hit, Hit. If Stay, then:
# => 7 Computer: Hit or Stay?
# => 8 Evaluate Hands
# => 9 Display Winner
# => 10 Play Again?
# => 11 If Yes, Loop Again (3)
# => 12 If No, Exit Loop and Goodbye.

DEALER_STANDS = 17

BLACKJACK = 21

GAME_LIMIT = 5

def prompt(msg)
  p "=> #{msg}"
end

def welcome
  system 'clear'
  p "W E L C O M E  T O  B L A C K J A C K"
  sleep 0.5
end

def ready?
  prompt "Are you ready to play?"
  answer = gets.chomp.downcase
  if answer.start_with?('y')
    best_of_five
    sleep 3
    return
  elsif answer.start_with?('n')
    p "Thank you. Come back when you are ready to play. Goodbye."
    exit
  else
    prompt "Invalid input. Please enter 'y' or 'n' to continue."
  end
  ready?
end

def initialize_deck
  system 'clear'
  suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
  values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
  deck = values.product(suits)
  deck.shuffle
end

def random_draw(deck)
  deck.pop
end

def best_of_five
  p "Fantastic! Best of Five Hands wins the Game!"
end

def new_round
  p "Next round. First player to reach #{GAME_LIMIT} point wins the game!"
end

def deal(deck, player_hand, dealer_hand)
  puts "<< DEALING >>"
  sleep 1
  2.times do
    player_hand << random_draw(deck)
    dealer_hand << random_draw(deck)
  end
  sleep 0.5
  puts ""
  p "Player >> #{join(player_hand)}"
  p "Dealer >> <UNKNOWN> | #{dealer_hand[1].join(' of ')}"
end

def join(hand, word = " of ")
  case hand.size
  when 1
    hand[0].to_s
  when 2
    "#{hand[0].join(word)} | #{hand[1].join(word)}"
  else
    "#{join(hand[0..-2])} | #{hand[-1].join(word)}"
  end
end

def player_move(deck, player_hand)
  loop do
    answer = hit_stay
    if answer == "h"
      player_hand << random_draw(deck)
      p "Player Hit: #{player_hand[-1].join(' of ')}"
      p "Player Cards: #{join(player_hand)}"
      p "Total Card Value: #{total(player_hand)}"
      puts ""
    end
    break if answer == "s" || busted?(player_hand)
  end
end

def dealer_move(deck, dealer_hand)
  loop do
    break if total(dealer_hand) >= DEALER_STANDS
    dealer_hand << random_draw(deck)
    sleep 1
    p "Dealer Hit: #{dealer_hand[-1].join(' of ')}"
    p "Dealer Cards: #{join(dealer_hand)}"
    p "Total Card Value: #{total(dealer_hand)}"
    puts ""
  end
end

def total(hand)
  values = hand.map { |card| card[0] }
  total = 0
  values.each do |value|
    total += 11 if value == "A"
    total += 10 if value.to_i == 0 # J Q K
    total += value.to_i
  end
  values.select { |value| value == "A" }.count.times do
    total -= 10 if total > 21
  end
  total
end

def valid_answer?(array, input)
  array.include?(input)
end

def hit_stay
  answer = ""
  loop do
    sleep 1
    puts ""
    prompt "Do you want to hit (h) or stay (s)?"
    answer = gets.chomp.downcase
    break if valid_answer?(["h", "s"], answer)
    p "Invalid entry. Please enter 'h' or 's' to proceed."
  end
  answer
end

def busted?(hand)
  total(hand) > BLACKJACK
end

def result(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)
  if busted?(player_hand)
    :player_bust
  elsif busted?(dealer_hand)
    :dealer_bust
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  elsif player_total == dealer_total
    :tie
  end
end

def display_winner(player_hand, dealer_hand)
  who_won = result(player_hand, dealer_hand)
  case who_won
  when :player_bust then p "Busted. Dealer wins this hand."
  when :dealer_bust then p "Dealer busted. You win this hand!"
  when :player then p "You win this hand!"
  when :dealer then p "The Dealer wins this hand."
  when :tie then p "Stalemate."
  end
end

def play_again?
  sleep 1
  puts ""
  prompt "Would you like to play again? (Y or N)"
  answer = gets.chomp.downcase
  if answer.start_with?('y')
    return false
  elsif answer.start_with?('n')
    return true
  else
    prompt "Invalid input. Please enter 'y' or 'n' to continue."
  end
  play_again?
end

#-------------

loop do
  welcome
  ready?
  player_score = 0
  dealer_score = 0

  loop do
    new_round
    deck = initialize_deck
    player_cards = []
    dealer_cards = []
    deal(deck, player_cards, dealer_cards)
    player_move(deck, player_cards)
    dealer_move(deck, dealer_cards) unless busted?(player_cards)
    display_winner(player_cards, dealer_cards)

    loop_result = result(player_cards, dealer_cards)
    player_score += 1 if loop_result == :dealer_bust || loop_result == :player
    dealer_score += 1 if loop_result == :player_bust || loop_result == :dealer
    sleep 3
    system 'clear'
    p "Player Score: #{player_score} | Dealer Score: #{dealer_score}"
    sleep 4
    break if player_score == GAME_LIMIT || dealer_score == GAME_LIMIT
  end
  if player_score == GAME_LIMIT
    puts ""
    p "PLAYER WINS THE GAME!"
  elsif dealer_score == GAME_LIMIT
    puts ""
    p "Dealer Wins the Game."
  end
  break if play_again?
end

p "Thank you for playing Blackjack! Goodbye."
