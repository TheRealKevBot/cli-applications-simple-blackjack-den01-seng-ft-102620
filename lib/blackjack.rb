require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_num)
  puts "Your cards add up to #{card_num}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  player_hand = 2.times.collect {deal_card}
  display_card_total(player_hand.sum)
  player_hand.sum
  x = deal_card
  y = deal_card
  return x + y
  display_card_total(x + y)

end

def invalid_command
  puts "Please enter a valid command"
end

def hit?(card_total)
  prompt_user
  answer = get_user_input
  if answer == "s"
    return card_total 
  elsif answer == "h"
    hand = deal_card + card_total
    return hand
  else
    invalid_command
    prompt_user
    get_user_input
  end
end


#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  until card_total > 21
    card_total = hit?(card_total)
    display_card_total(card_total)
  end
  end_game(card_total)
end
    
runner