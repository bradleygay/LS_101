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

CARD_VALUES = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6,
                "7" => 7, "8" => 8, "9" => 9, "10" => 10, "J" => 10,
                "Q" => 10, "K" => 10 }

DEALER_STANDS = 17

BLACKJACK = 21

def prompt(msg)
  p "=> #{msg}"
end

def welcome
  system 'clear'
  p "W E L C O M E  T O  B L A C K J A C K"
  sleep 0.5
end

def ready?
  p "Are you ready to play? (Y/N)"
  answer = gets.chomp
  if answer.downcase.start_with?('y')
    return false
  elsif answer.downcase.start_with?('n')
    p "Thank you. Come back when you are ready to play. Goodbye."
    exit
  else
    p "Invalid input. Please enter 'y' or 'n' to continue."
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
  puts ""
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
    answer = hit_stay?
    if answer == "h"
      player_hand << random_draw(deck)
      prompt "Player Hit: #{player_hand[-1].join(' of ')}"
      prompt "Player Cards: #{join(player_hand)}"
      prompt "Total Card Value: #{total(player_hand)}"
    end
    break if answer == "s" || busted?(player_hand)
  end
end

def dealer_move(deck, dealer_hand)
  loop do
    break if total(dealer_hand) >= DEALER_STANDS
    dealer_hand << random_draw(deck)
    prompt "Dealer Hit: #{dealer_hand[-1].join(' of ')}"
    prompt "Dealer Cards: #{join(dealer_hand)}"
    prompt "Total Card Value: #{total(dealer_hand)}"
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

def hit_stay?
  answer = ""
  loop do
    prompt "Do you want to hit (h) or stay (s)?"
    answer = gets.chomp.downcase
    break if answer.include?('h') || answer.include?('s')
    p "Invalid entry. Please enter 'h' or 's' to proceed."
  end
  answer
end

def busted?(hand)
  total(hand) > BLACKJACK
end

def result?(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)
  return :player_bust if busted?(player_hand)
  return :dealer_bust if busted?(dealer_hand)
  return :player if player_total > dealer_total
  return :dealer if player_total < dealer_total
  return :tie if player_total == dealer_total
end

def winner(player_hand, dealer_hand)
  who_won = result?(player_hand, dealer_hand)
  case who_won
  when :player_bust then prompt "Busted. Dealer wins this hand."
  when :dealer_bust then prompt "Dealer busted. You win this hand!"
  when :player then prompt "You win this hand!"
  when :dealer then prompt "The Dealer wins this hand."
  when :tie then prompt "Stalemate."
  end
end

def play_again?
  puts ""
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

welcome
ready?
loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  deal(deck, player_cards, dealer_cards)
  player_move(deck, player_cards)
  dealer_move(deck, dealer_cards) unless busted?(player_cards)
  winner(player_cards, dealer_cards)
  break if play_again?
end

prompt "Thank you for playing Blackjack!"
prompt "Goodbye."
