class Game

    @@victory = false
    # Variable de classe qui permet de "casser" la loop si quelqu'un gagne
  
    def initialize  
      puts "Bienvenue sur le meilleur jeu Morpion du monde."
      @p_one = Player.new
      @p_one.infos
      @p_two = Player.new
      @p_two.infos
      @board_game = Board.new
    end
  
    def go
      puts "Let's go !"
      i = 0
      loop do
        break if i > 8
        # Pas plus de 9 étapes de jeu car après, la board est entièrement remplie !
        self.turn(@p_one)
        i +=1
        if @@victory
            # Win du player 1, break de la loop si besoin et affiche la board finie
          puts "\nThere is a winner :"
          @board_game.show
          puts "\nGood game #{@p_one.pname} !"
          puts "#{@p_two.pname}, T'es nul!"
          break
        end
        break if i > 8
        self.turn(@p_two)
        i +=1
        if @@victory
            # Win du player 2, break de la loop si besoin et affiche la board finie
          puts "\nThere is a winner :"
          @board_game.show
          puts "\nGood game #{@p_two.pname} !"
          puts "#{@p_one.pname}, T'es nul! "
          break
        end
      end
      @board_game.show
      # Affiche la board lorsque le jeu est fini, et la board remplie entièrement
      puts "Egalité! Vous êtes aussi nul l'un que l'autre." if @@victory == false
      # Si aucune victoire, affiche message d'égalité
      puts "#{@p_one.pname} : #{@p_one.ppoints} VS #{@p_two.pname} : #{@p_two.ppoints}"
      # Affiche l'état des points dans tous les cas à la fin
      puts "Try again ? Y/N"
      # Propose un nouveau jeu en gardant en mémoire les points
      choice = (gets.chomp).to_s.capitalize
      if choice == "Y"
        @@victory = false
        @board_game = Board.new
        self.go
      end
  
    end
  
    def turn(player)
      @choice = 0
      @board_game.show
      puts "C'est le tour de #{player.pname}"
      puts "Choisie un nombre entre 1 et 9 :"
      while !((1..9).include?(@choice)) do
        @choice = (gets.chomp).to_i
      end
      @board_game.get_player_choice(@choice, player.pmark, player)
      if @board_game.victory(player)
        @@victory = true
        player.ppoints += 1
      end
    end
  
  end