range_from = 1
range_to = 2

number_to_guess = rand(range_to) + 1

print "Guess Number(#{range_from}-#{range_to}): "
user_number = gets.to_i

puts "You won!" if user_number == number_to_guess
puts "You lost, the number was #{number_to_guess}" unless user_number == number_to_guess
