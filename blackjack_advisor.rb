
hand_vs_dealer = {}

card_value_conversion = {
  "A" => 11,
  "J" => 10,
  "K" => 10,
  "Q" => 10,
  "10" => 10,
  "9" => 9,
  "8" => 8,
  "7" => 7,
  "6" => 6,
  "5" => 5,
  "4" => 4,
  "3" => 3,
  "2" => 2,
  "1" => 1
}

# if hard:
optimal_moves = {
  "HIT!" => {
    5 => [*2..11],
    6 => [*2..11],
    7 => [*2..11],
    13 => [*7..11],
    14 => [*7..11],
    15 => [*7..11],
    16 => [*7..11]
  },
  "Double-hit!" => {
    8 => [*5..6],
    9 => [*7..11],
    10 => [*10..11],
    11 => [*2..11],
  },
  "Stand." => {
    12 => [*4..6],
    13 => [*2..6],
    14 => [*2..6],
    15 => [*2..6],
    16 => [*2..6],
    17 => [*2..11],
    18 => [*2..11],
    19 => [*2..11],
    20 => [*2..11],
    21 => [*2..11]
  }
}

def get_optimal_move(sum, dealer_card, optimal_moves)
  optimal_moves.each do |optimal_move, user_vs_dealer|
    if user_vs_dealer.has_key?(sum)
      dealer_cards = user_vs_dealer[sum]
      if dealer_cards.include?(dealer_card)
        return optimal_move
      end
    end
  end
end

def get_card_make_number(card_value_conversion)
  card = gets.chomp.upcase
  card_value = card_value_conversion[card]
    while card_value == nil
      puts "That doesn't look like a card. Won't you try 1-10 or a face card?"
      print "> "
      card_value = get_card_make_number(card_value_conversion)
    end
  return card_value
end

puts "Time to enter your first card, Tex. (Ace = A, Jack, Queen, King = J, Q, K respectively.)"
print "> "

card_value_one = get_card_make_number(card_value_conversion)

puts "Enter your second card."
print "> "

card_value_two = get_card_make_number(card_value_conversion)
full_hand_sum = card_value_one + card_value_two

puts "Now enter the dealer's first card."
print "> "

card_value_dealer = get_card_make_number(card_value_conversion)
hand_vs_dealer[full_hand_sum] = card_value_dealer

if card_value_one == card_value_two
  puts "pair stuff goes here."
  # ran out of time to upload all these hash values.
elsif card_value_one != 11 && card_value_two != 11
  optimal_move = get_optimal_move(full_hand_sum, card_value_dealer, optimal_moves)
  puts "Looks like you should #{optimal_move}."
else
  puts "soft"
  # ran out of time to upload these hash values!
end
