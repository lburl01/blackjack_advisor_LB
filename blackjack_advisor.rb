
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
}

# if hard:
optimal_moves_hard = {
  "HIT!" => {
    5 => [*2..11],
    6 => [*2..11],
    7 => [*2..11],
    8 => [*2..4, *7..11],
    9 => [*7..11],
    10 => [10, 11],
    12 => [2, 3, *7..11],
    13 => [*7..11],
    14 => [*7..11],
    15 => [*7..11],
    16 => [*7..11]
  },
  "Double-hit!" => {
    8 => [5, 6],
    9 => [*2..6],
    10 => [*2..9],
    11 => [*2..11]
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

# if soft
optimal_moves_soft = {
  "HIT!" => {
    13 => [2, 3, *7..11],
    14 => [2, 3, *7..11],
    15 => [2, 3, *7..11],
    16 => [2, 3, *7..11],
    17 => [*7..11],
    18 => [9, 10]
  },
  "Double-hit!" => {
    13 => [*4..6],
    14 => [*4..6],
    15 => [*4..6],
    16 => [*4..6],
    17 => [*2..6]
  },
  "Stand." => {
    18 => [2, 7, 8, 11],
    19 => [*2..5, *7..11],
    20 => [*2..11],
    21 => [*2..11]
  }
}

# if pairs
optimal_moves_pairs = {
  "HIT!" => {
    4 => [*8..11],
    6 => [*9..1],
    8 => [2, 3, *7..11],
    10 => [10, 11],
    12 => [*8..11],
    14 => [9, 11]
  },
  "Double-hit!" => {
    10 => [*2..9]
  },
  "Stand." => {
    14 => [10],
    18 => [7, 10, 11],
    20 => [*2..11]
  }
}

# what do I do for instances where one of the "optimal moves" doesn't exist for that hand type? IE in pairs, if you have two 8s, you should split. But no other hand types recommend a split ever. So if I put "Split" into just the pairs hash, then when it iterates through all the keys, on hand types other than pair I get a NoMethodError because it returns nill.

# I also have a problem where if you pick a hand that doesn't exist in my hashes you get all the optimal moves types printed out to you.

def get_optimal_move(sum, dealer_card, optimal_moves)
  # I want the order to check stand, hit, then double-hit in that order. So i'm going to call the keys stand, hit, double-hit and then move through my regular function I had previously. The only thing I have to add is assigning the user_vs_dealer to the appropriate value.
  ['Stand.', 'Double-hit!', 'HIT!'].each do |optimal_move|
    user_vs_dealer = optimal_moves[optimal_move]
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
  optimal_moves_pairs = get_optimal_move(full_hand_sum, card_value_dealer, optimal_moves_pairs)
  puts "Looks like you should #{optimal_moves_pairs}."
elsif card_value_one != 11 && card_value_two != 11
  optimal_moves_hard = get_optimal_move(full_hand_sum, card_value_dealer, optimal_moves_hard)
  puts "Looks like you should #{optimal_moves_hard}."
else
  optimal_moves_soft = get_optimal_move(full_hand_sum, card_value_dealer, optimal_moves_soft)
  puts "Looks like you should #{optimal_moves_soft}."
end
