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

def valid_float?(num)
  Float(num)
end

def valid_positive_float?(num)
  valid_float?(num) && num.to_f() >= 0.00
end

def valid_loan_amount?(num)
  if valid_positive_float?(num)
    true
  else
    prompt(MESSAGES['valid_number'])
    false
  end
end

def valid_time?(num)
  if valid_positive_float?(num)
    true
  else
    prompt(MESSAGES['valid_number'])
    false
  end
end

def valid_apr?(num)
  if valid_positive_float?(num) && num.to_f() <= 100.00
    true
  else
    prompt(MESSAGES['valid_apr'])
    false
  end
end

# --------------------------------------------------------

# English
prompt(messages('welcome', 'en'))
# Spanish
prompt(messages('welcome', 'es'))

# --------------------------------------------------------

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
prompt("Hello, #{name}!")

# --------------------------------------------------------

loop do
  prompt(MESSAGES['loan_request'])
  loan_request = ""
  loop do
    loan_request = Kernel.gets().chomp()
    if loan_request.empty?()
      prompt(MESSAGES['valid_number'])
    elsif valid_loan_amount?(loan_request)
      break
    end
  end

  prompt(MESSAGES['duration'])
  time = ""
  loop do
    time = Kernel.gets().chomp()
    if time.empty?()
      prompt(MESSAGES['valid_number'])
    elsif valid_time?(time)
      break
    end
  end

  prompt(MESSAGES['apr_request'])
  apr = ""
  loop do
    apr = Kernel.gets().chomp()
    if apr.empty?()
      prompt(MESSAGES['valid_apr'])
    elsif valid_apr?(apr)
      break
    end
  end

  months = time.to_f() * 12
  monthly = (apr.to_f() / 100) / 12

  # m = p * (j / (1 - (1 + j)**(-n)))
  # monthly payment = loan amount * (MIR / (1 - (1 + MIR)**(-duration)))

  first_calculation = (1 + monthly)**-months
  second_calculation = monthly / (1 - first_calculation)
  third_calculation = loan_request.to_f() * second_calculation

  prompt(MESSAGES['result'] + format('%0.2f', third_calculation) + ".")

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
