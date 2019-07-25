require 'color_text'
require_relative 'lib/app/board'       # On effectue le lien avec les fichiers de chaque Classe.
require_relative 'lib/app/board_case'
require_relative 'lib/app/game'
require_relative 'lib/app/player'

game = Game.new                        # On crée une nouvelle partie.
game.go    