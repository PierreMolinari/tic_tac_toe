class Game
  attr_accessor :board, :player1, :player2, :current_player
  #on creer un plateau avec 2 joueurs 
  #current_player permet de manipuler a tour de role
  def initialize
      @board = Board.new
      @player1 = Player.new("joueur X", "x")
      @player2 = Player.new("joueur Y", "o")
      @current_player = @player1
  end

  #ici on est fairplay 
  def who_first
      rand_p1 = rand(1..6)
      rand_p2 = rand(1..6)
      while rand_p1 == rand_p2
          rand_p1 = rand(1..6)
          rand_p2 = rand(1..6)
      end
      if rand_p1 > rand_p2
          puts "le joueur 1 va commencer "
          @current_player = @player1
      else
          puts "le joueur 2 va commancer"
          @current_player = @player2
      end
  end

  #changement de joueur
  def switch_player
      if @current_player == player1
          @current_player = player2
      else
          @current_player = player1
      end
  end

  def choice_case(input_location, symbol = current_player.symbol)
      @board.case_change(symbol, input_location)
  end

  def play
      i = 0
      who_first
      while i <= 8 || @board.victory?
          @board.show_board
          puts "choisie une case"
          input = gets.chomp.to_i
          choice_case(input)
          switch_player
          i+=1
      end
  end

end