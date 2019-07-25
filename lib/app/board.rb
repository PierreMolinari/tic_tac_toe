class Board
  attr_accessor :board, :case

  def initialize
      @board = []
      @board = 9.times.map {|i| @board[i] = BoardCase.new(i)}
  end

  def show_board
      puts " #{@board[0].case} | #{@board[1].case} | #{@board[2].case}"
      puts " #{@board[3].case} | #{@board[4].case} | #{@board[5].case}"
      puts " #{@board[6].case} | #{@board[7].case} | #{@board[8].case}"
  end

  def case_change(symbol, location)
      if case_can_be_change(location)
          @board[location].change_case(symbol)
      else
          puts "pas la place pour toi"
      end
  end

  def case_can_be_change(location)
      true if @board[location].case == ' '
  end
  
  def victory?
      if test_victory(0, 1, 2)
          return true
      elsif test_victory(3, 4, 5)
          return true
      elsif test_victory(6, 7, 8)
          return true
      elsif test_victory(0, 3, 6)
          return true         
      elsif test_victory(1, 4, 7)
          return true
      elsif test_victory(2, 5, 8)
          return true
      elsif test_victory(0, 4, 8)
          return true
      elsif test_victory(2, 4, 6)
          return true
      end
  end

  def test_victory(a, b, c)
      @board[a].case == @board[b].case && @board[b].case == @board[c].case
  end
end
