all_cards = []
dealer_card_arr = []
user_and_dealer_cards = {}

def convert_to_f(card, all_cards)
  if card.to_f != 0
    all_cards << card.to_f
  elsif card == "J" || card == "Q" || card == "K" || card == "A"
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

# soft hand = has at least one ace
def is_soft?(all_cards)
  all_cards.include?(11.0)
end

def is_pair?(all_cards)
  all_cards.first == all_cards.last
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

sum = all_cards.first + all_cards.last

puts "Sum of user's cards: #{sum}"

puts "Enter the dealer's first card: "
print "> "

dealer_card = gets.chomp.upcase

convert_to_f(dealer_card, dealer_card_arr)
convert_faces_to_num(dealer_card_arr)

user_and_dealer_cards[sum] = dealer_card_arr

if is_pair?(all_cards)
  puts "pair stuff goes here."
elsif is_soft?(all_cards) == false
  puts "not soft"
else is_soft?(all_cards)
  puts "soft"
end

# puts "Your optimal move is to #{optimal_move}."
