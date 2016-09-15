card_number = {}
dealer_card = []

2.times {
puts "Enter your first card, Tex: "
print "> "

card_one = gets.chomp.to_f

puts "Enter your second card: "
print "> "

card_two = gets.chomp.to_f

card_number[card_one] = card_two
}

print card_number.to_a

puts "Enter the dealer's first card: "
print "> "

dealer_card = gets.chomp.to_f

# puts "Your optimal move is to #{optimal_move}."
