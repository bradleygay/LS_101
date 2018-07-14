flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# flintstones = flintstones.to_a
# flintstones.delete_if { |x,y| x != "Barney" && y != 2 }
# flintstones.flatten!
# p flintstones

p flintstones.assoc("Barney")