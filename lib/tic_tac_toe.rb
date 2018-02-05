class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #right diagonal
    [2,4,6] #left diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(@board, index)
      return false
    elsif index >= 0 && index <= (@board.length-1)
      return true
    end
  end

  def turn
    token = current_player(@board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      puts "That's not a valid move. Please try again."
      input = gets.strip
      index = input_to_index(input)
    else
      move(index, token)
    end
    display_board
  end

  def turn_count
    taken_positions = @board.select do |position|
      !(position.nil? || position == " ")
    end
    return taken_positions.length
  end

  def current_player
    (turn_count(@board) % 2 == 0) ? "X" : "O")
  end

end
