# Rock Paper Scissors Game
# User enters choice
# Computer enters choice
# Winner is displayed

require 'yaml'
MESSAGES = YAML.load_file('rps.yml')

VALID_CHOICES = %w(rock paper scissors lizard spock)

ABBREV_HASH = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WIN_HASH = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(paper spock),
  'spock' => %w(rock scissors)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  WIN_HASH[first].include?(second)
end

def result(player, computer)
  if win?(player, computer)
    prompt(MESSAGES['win'])
  elsif win?(computer, player)
    prompt(MESSAGES['lose'])
  else
    prompt(MESSAGES['tie'])
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

  Kernel.puts("You chose: #{choice}. The computer chose: #{computer_choice}.")

  result(choice, computer_choice)

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
