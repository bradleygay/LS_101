# Rock Paper Scissors Game
# User enters choice
# Computer enters choice
# Winner is displayed

require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

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
    prompt("You won this round!")
  when "Lose"
    prompt("The computer won this round.")
  when "Tie"
    prompt("You tied the computer this round.")
  end
end

# Retrieve an item in hash through indexing
def verify_abbrev(input)
  ABBREV_HASH[input]
end

prompt(MESSAGES['name'])
name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
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
        prompt("That is not a valid choice. Please make a new selection.")
      end
    end

    computer_choice = VALID_CHOICES.sample().downcase()

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

    break if user_wins == 5 || computer_wins == 5
  end

  if user_wins == 5
    prompt("You won the entire game!")
  else
    prompt("The computer won the game.")
  end

  prompt(MESSAGES['again'])
  answer = ""
  loop do
    answer = Kernel.gets().chomp()
    if answer.downcase().start_with?("n")
      return prompt(MESSAGES['goodbye'])
    elsif answer.downcase().start_with?("y")
      break
    elsif answer.empty?()
      prompt(MESSAGES['invalid_again'])
    else
      prompt(MESSAGES['invalid_again'])
    end
  end
end
