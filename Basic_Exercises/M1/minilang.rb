def minilang(str)
  stack = []
  register = 0
  str.split.each do |element|
    case element
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then p "#{register}"
    else         register = element.to_i
    end
  end
end
