all_cards = []
dealer_card_arr = []
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

optimal_move_if_hard = {
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

# soft hand = has at least one ace
def is_soft?(all_cards)
  all_cards.include?(11.0)
end

def is_pair?(all_cards)
  all_cards.first == all_cards.last
end

puts "Time to enter your first card, Tex. (Ace = A, Jack, Queen, King = J, Q, K respectively.)"
print "> "

card_one = gets.chomp.upcase

card_value_one = card_value_conversion[card_one]

puts "Enter your second card."
print "> "

card_two = gets.chomp.upcase

card_value_two = card_value_conversion[card_two]

full_hand_sum = card_value_one + card_value_two

puts "Now enter the dealer's first card."
print "> "

dealer_card = gets.chomp.upcase

card_value_dealer = card_value_conversion[dealer_card]

hand_vs_dealer[full_hand_sum] = card_value_dealer

puts "#{hand_vs_dealer}"

# if is_pair?(all_cards)
#   puts "pair stuff goes here."
# elsif is_soft?(all_cards) == false
#     puts "hard"
# else is_soft?(all_cards)
#   puts "soft"
# end
