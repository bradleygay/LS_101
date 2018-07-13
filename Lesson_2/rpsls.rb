# Rock Paper Scissors Lizard Spock Game
# User enters choice
# Computer enters choice
# Winner is displayed

require 'yaml'
MESSAGES = YAML.load_file('rpsls.yml')

#--------------------------------------

VALID_CHOICES = %w(rock paper scissors lizard spock)

WIN_HASH = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(rock scissors)
}
ABBREV_HASH = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_SCORE = 5

#--------------------------------------

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_HASH[first].include?(second)
end

def result(player, computer)
  if win?(player, computer)
    "Win"
  elsif win?(computer, player)
    "Lose"
  else
    "Tie"
  end
end

def print_result(input)
  case input
  when "Win"
    prompt(MESSAGES['win'])
  when "Lose"
    prompt(MESSAGES['lose'])
  when "Tie"
    prompt(MESSAGES['tie'])
  end
end

# Retrieve an item in hash through indexing
def verify_abbrev(input)
  ABBREV_HASH[input]
end

def play_again?
  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp().downcase()
  if answer.start_with?("n")
    return true
  elsif answer.start_with?("y")
    return false
  else
    prompt(MESSAGES['invalid_again'])
  end
  play_again?
end

def clear_screen
  system("clear") || system("cls")
end

#--------------------------------------

prompt(MESSAGES['name'])
name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?() || name.squeeze == ' '
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

name.strip!
name.capitalize!
prompt("Hello, #{name}!")
prompt(MESSAGES['welcome'])

loop do
  user_wins = 0
  computer_wins = 0
  loop do
    choice = ""
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      options = <<-MSG
      (r) for rock
         (p) for paper
         (sc) for scissors
         (l) for lizard
         (sp) for spock
      MSG
      prompt(options)
      choice = Kernel.gets().chomp().downcase()
      if VALID_CHOICES.include?(choice) || (choice = verify_abbrev(choice))
        break
      else
        prompt(MESSAGES['valid_choice'])
      end
    end

    computer_choice = VALID_CHOICES.sample().downcase()

    clear_screen

    prompt("You chose: #{choice}. The computer chose: #{computer_choice}.")

    final = result(choice, computer_choice)
    if final == "Win"
      user_wins += 1
    elsif final == "Lose"
      computer_wins += 1
    end

    print_result(final)
    prompt("Total User Wins: #{user_wins}")
    prompt("Total Computer Wins: #{computer_wins}")


    break if user_wins == WINNING_SCORE || computer_wins == WINNING_SCORE
  end
  
  if user_wins == WINNING_SCORE
    prompt(MESSAGES['overall_win'])
  else
    prompt(MESSAGES['overall_lose'])
  end

  break if play_again?
end

prompt(MESSAGES['goodbye'])
