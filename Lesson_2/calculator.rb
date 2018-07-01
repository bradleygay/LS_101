# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers provided
# output the result

# answer = Kernel.gets()
# Kernel.puts(answer)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s() == num
end

def number?(input)
  input.to_f.to_s() == input
end

def operation_to_message(op)
  operation = case op
              when '1'
                'Adding'
              when '2'
                'Subtracting'
              when '3'
                'Multiplying'
              when '4'
                'Dividing'
              end
  operation
end

# english
prompt(messages('welcome', 'en'))
# spanish
prompt(messages('welcome', 'es'))

name = ""
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}!")

loop do
  number1 = ""
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    elsif number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = ""
  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    elsif number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ""
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  prompt("The result is #{result}.")

  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt(MESSAGES['goodbye'])
