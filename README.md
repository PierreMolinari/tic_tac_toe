# Pour faire fonctionner ce programme:

Veuillez cloner ce repo sur votre machine avec la commande suivante :

 **$ git clone https://github.com/PierreMolinari/tic_tac_toe**

Ensuite, le jeu utilise une gem supplémentaire pour agrémenter un peu le jeu : color_text. Pour cela, effectuez un :

 **$ bundle install**

# Fonctionnement du jeu

Lors du lancement du jeu, celui-ci demande le pseudo du joueur qui jouera en premier, et lui demande de choisir entre les marques X ou O.

Ensuite, le jeu demandera le pseudo du second joueur, qui jouera forcement avec la marque restante.

Lancement du jeu ! Chacun son tour, chaque joueur sélectionne une case de 1 à 9 pour la remplir avec son symbole. Deux cas de fin de partie sont possibles :

    Un des joueurs gagne, son compteur de points est incrémenté et le jeu est terminé et propose une nouvelle partie.

    Aucun des joueurs n'a gagné, l'égalité est déclarée et le jeu est terminé et propose une nouvelle partie.

Le nombre de parties rémportées est comptabilisé à chaque lancement du jeu !
Conditions de test du jeu pour les corrections

# Lancez le fichier app.rb à la racine du repo.