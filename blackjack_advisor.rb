card_total = []
dealer_card = []

# convert JQK to numeral 10, A to numeral 11
def convert_faces_to_num(card_total)
  card_total.map! { |x| x != "J" ? x : 10}
  card_total.map! { |x| x != "Q" ? x : 10}
  card_total.map! { |x| x != "K" ? x : 10}
  card_total.map! { |x| x != "A" ? x : 11}
end

# hand has no ace
def is_hard?
end

# hand has at least one ace
def is_soft?
end

puts "Time to enter your first card, Tex. (Ace = A, Jack, Queen, King = J, Q, K respectively)"
print "> "

card_one = gets.chomp.upcase

card_total << card_one

puts "Enter your second card: "
print "> "

card_two = gets.chomp.upcase

card_total << card_two

print "#{card_total}"


puts "Enter the dealer's first card: "
print "> "

dealer_card = gets.chomp

# puts "Your optimal move is to #{optimal_move}."
