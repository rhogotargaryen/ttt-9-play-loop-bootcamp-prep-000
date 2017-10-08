# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index)
  board[index] = $current_player
  toggle_player
  $turn_counter += 1
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    if valid_move?(board, index)
    move(board, index)
    display_board(board)
    else
    turn(board)
    end
end

  $turn_counter = 0

# Define your play method below
def play(board)
  while $turn_counter < 9
    turn(board)
  end
  while $turn_counter = 9
    puts "Gameboard Full, play again? (y/n)"
    ans = gets.strip
    if ans == "y"
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    $turn_counter = 0
    play(board)
    else
      break
    end
  end
end

def toggle_player
  if $current_player == "X"
    $current_player = "O"
  elsif $current_player == "O"
    $current_player = "X"
  end
end
