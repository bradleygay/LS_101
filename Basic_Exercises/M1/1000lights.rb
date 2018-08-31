def lightboard(num_of_lights)
  lights = Hash.new
  (1..num_of_lights).map { |number| lights[number] = "OFF" }
  lights
end

def switch(lights)
  lights.transform_values! do |value|
    value == "OFF" ? value = "ON" : value = "OFF"
  end
end

def multiples_two(lights)
  new_hsh = lights.select do |key, value|
    key % 2 == 0
  end
  new_hsh_on = switch(new_hsh)
  lights.merge!(new_hsh_on)
end

def multiples_three(lights)
  new_hsh = lights.select do |key, value|
    key % 3 == 0
  end
  new_hsh_on = switch(new_hsh)
  lights.merge!(new_hsh_on)
end

#-------------

def toggle(num_of_lights)
  lights = lightboard(num_of_lights)
  result = []
  counter = 1
  loop do
    if counter == 1
      switch(lights)
    elsif counter.even?
      multiples_two(lights)
    else
      multiples_three(lights)
    end
    counter += 1
    break if counter > num_of_lights
  end
  lights.select { |key, value| result << key if value == "ON" }
  result
end
