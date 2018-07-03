# Loan Amount (loan -> total requested)
# Annual Percentage Rate (mr -> apr / 12)
# Loan Duration (time -> year * 12)

require 'yaml'
MESSAGES = YAML.load_file('mortgage.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num
end

def monthly_mortgage(x, y, z)
  x * (y / (1 - (1 + y)**(-z * 12)))
end

def number?(input)
  input.to_f.to_s() == input
end

# Y
# Monthly Rate = APR / 12
thirty_year_mr = 0.04706 / 12
twenty_year_mr = 0.04571 / 12
fifteen_year_mr = 0.04371 / 12

# English
prompt(messages('welcome', 'en'))
# Spanish
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

prompt("Hello, #{name}!")

loop do
  prompt(MESSAGES['request'])

  # X
  loan = ""
  loop do
    loan = Kernel.gets().chomp()
    if valid_number?(loan)
      break
    elsif number?(loan)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['duration'])

  # Z
  time = ""
  loop do
    time = Kernel.gets().chomp()
    if %w(30 20 15).include?(time)
      break
    else
      prompt(MESSAGES['time_valid'])
    end
  end

  result = case time
           when '30'
             monthly_mortgage(loan.to_f(), thirty_year_mr.to_f(), time.to_f())
           when '20'
             monthly_mortgage(loan.to_f(), twenty_year_mr.to_f(), time.to_f())
           when '15'
             monthly_mortgage(loan.to_f(), fifteen_year_mr.to_f(), time.to_f())
           end

  prompt("Wonderful. Your monthly mortgage payment will be $#{result.round(2)}.")

  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt(MESSAGES['goodbye'])
