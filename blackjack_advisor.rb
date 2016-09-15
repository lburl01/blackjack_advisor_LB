card_total = []
dealer_card = []

 #|| card != "K" || card != "Q"
def convert_to_f(card, card_total)
  if card.to_f != 0
    card_total << card.to_f
  elsif card == "J"
    card_total << card
  elsif card == "Q"
    card_total << card
  elsif card == "K"
    card_total << card
  end
end

# convert JQK to numeral 10, A to numeral 11
def convert_faces_to_num(card_total)
  card_total.map! { |x| x != "J" ? x : 10.0}
  card_total.map! { |x| x != "Q" ? x : 10.0}
  card_total.map! { |x| x != "K" ? x : 10.0}
  card_total.map! { |x| x != "A" ? x : 11.0}
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

convert_to_f(card_one, card_total)
convert_faces_to_num(card_total)

puts "Enter your second card: "
print "> "

card_two = gets.chomp.upcase

convert_to_f(card_two, card_total)
convert_faces_to_num(card_total)

print "#{card_total}"


puts "Enter the dealer's first card: "
print "> "

dealer_card = gets.chomp

# puts "Your optimal move is to #{optimal_move}."
