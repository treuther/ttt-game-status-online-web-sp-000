require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],      #top_row_win        [0]
  [3, 4, 5],      #middle_row_win     [1]
  [6, 7, 8],      #bottom_row_win     [2]
    [0, 3, 6],    #left_column_win    [3]
    [1, 4, 7],    #middle_column_win  [4]
    [2, 5, 8],    #right_column_win   [5]
      [0, 4, 8],  #left_diagonal_win  [6]
      [2, 4, 6]   #right_diagonal_win [7]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
      combo
    end
  end
end

def full?(board)
  if (!board.any?{|position| position == " "})
    return true
  else
    return false
end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    return false
end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
end
end

def winner(board)
  position = won?(board)
  if position == nil
    return nil
  elsif board[position[0]] == "X"
    return "X"
  elsif board[position[0]] == "O"
    return "O"
end
end
