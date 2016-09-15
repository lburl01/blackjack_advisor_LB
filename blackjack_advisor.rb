all_cards = []
dealer_card_arr = []

def convert_to_f(card, all_cards)
  if card.to_f != 0
    all_cards << card.to_f
  elsif card == "J"
    all_cards << card
  elsif card == "Q"
    all_cards << card
  elsif card == "K"
    all_cards << card
  elsif card == "A"
    all_cards << card
  end
end

def convert_faces_to_num(all_cards)
  all_cards.map! { |x| x != "J" ? x : 10.0}
  all_cards.map! { |x| x != "Q" ? x : 10.0}
  all_cards.map! { |x| x != "K" ? x : 10.0}
  all_cards.map! { |x| x != "A" ? x : 11.0}
end

def add_two_cards(all_cards, sum)
  sum = all_cards.first + all_cards.last
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

convert_to_f(card_one, all_cards)
convert_faces_to_num(all_cards)

puts "Enter your second card: "
print "> "

card_two = gets.chomp.upcase

convert_to_f(card_two, all_cards)
convert_faces_to_num(all_cards)

puts "#{all_cards}"

sum = all_cards.first + all_cards.last

puts "Sum of user's cards: #{sum}"

puts "Enter the dealer's first card: "
print "> "

dealer_card = gets.chomp.upcase

convert_to_f(dealer_card, dealer_card_arr)
convert_faces_to_num(dealer_card_arr)

puts "#{dealer_card_arr}"



# puts "Your optimal move is to #{optimal_move}."
