class Game

    @@victory = false                                                                         # Variable de classe qui permet de "casser" la loop si quelqu'un gagne
  
    def initialize                                                                            # Demande les paramètres aux joueurs
      puts "Bienvenue sur le meilleur jeu Morpion du monde."
      @p_one = Player.new
      @p_one.infos
      @p_two = Player.new
      @p_two.infos
      @board_game = Board.new
    end
  
    def go                                                                                    # Lancement du jeu
      puts "Let's go !"
      i = 0
      loop do
        break if i > 8                                                                        # Pas plus de 9 étapes de jeu car après, la board est entièrement remplie !
        self.turn(@p_one)                                                                     # Appelle le tour du player 1
        i +=1
        if @@victory                                                                          # Win du player 1, break de la loop si besoin et affiche la board finie
          puts "\nThere is a winner :"
          @board_game.show
          puts "\nGood game #{@p_one.pname} !"
          puts "#{@p_two.pname}, T'es nul!"
          break
        end
        break if i > 8
        self.turn(@p_two)                                                                     # Appelle le tour du player 2
        i +=1
        if @@victory                                                                          # Win du player 2, break de la loop si besoin et affiche la board finie
          puts "\nThere is a winner :"
          @board_game.show
          puts "\nGood game #{@p_two.pname} !"
          puts "#{@p_one.pname}, T'es nul! "
          break
        end
      end
      @board_game.show                                                                        # Affiche la board lorsque le jeu est fini, et la board remplie entièrement
      puts "Egalité! Vous êtes aussi nul l'un que l'autre." if @@victory == false                                              # Si aucune victoire, affiche message d'égalité
      puts "#{@p_one.pname} : #{@p_one.ppoints} VS #{@p_two.pname} : #{@p_two.ppoints}"       # Affiche l'état des points dans tous les cas à la fin
      puts "Try again ? Y/N"                                                                  # Propose un nouveau jeu en gardant en mémoire les points
      choice = (gets.chomp).to_s.capitalize
      if choice == "Y"                                                                        # Si oui, RAZ de la board, et passage de la précédente victoire si présente à false
        @@victory = false
        @board_game = Board.new
        self.go                                                                               # Relancement du jeu avec une board "propre" et les points gardés en mémoire
      end
  
    end
  
    def turn(player)                                                                          # Action à faire lors d'un tour d'un player
      @choice = 0
      @board_game.show                                                                        # Affiche la board et donc ses possibilités
      puts "C'est le tour de #{player.pname}"
      puts "Choisie un nombre entre 1 et 9 :"
      while !((1..9).include?(@choice)) do                                                     # Permet de ne rentrer uniquement les possibilités de 1 à 9
        @choice = (gets.chomp).to_i
      end
      @board_game.get_player_choice(@choice, player.pmark, player)                             # Appelle la fonction qui permet de lancer la modification de la case si possible
      if @board_game.victory(player)                                                           # Si une des conditions de victoire remplie, @@victory à 1 et ajout de 1 aux victoires du player entré en paramètres
        @@victory = true
        player.ppoints += 1
      end
    end
  
  end