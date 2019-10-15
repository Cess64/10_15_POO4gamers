require 'bundler'   # lignes très pratiques qui appellent les gems du Gemfile.
Bundler.require

require_relative 'lib/game'  # lignes qui appellent les fichiers lib/user.rb et lib/event.rb
require_relative 'lib/player'

puts " ===>>  En direct du tatami de l'Elysée!!!!  "                        
puts " ==========>>>>>>>>>    Devant un public en feu !!!  "       
puts " ==================>>>>>>>>>    Nous te proposons un combat ethiquable, puisque non équitable !!!    "                                                                                             
puts "================================================= >>>>> >>>> >>> >> Face à MANU A.K.A. le philosophe devenu banquier !!    "
puts "===============================================================================================puis président...SHUT !!====="
puts "================================================================>>>>> Et sa tribu d'aliénés en croc-chaussettes, hahaha ===="
puts "============================================================================================================================"
puts "============================================================================================================================"
puts "                                                                                                                            "
puts "Quel est ton nom, jeune moussaillon ?"

name = gets.chomp.to_s    # on récupère la saisie du joueur !
my_game = Game.new(name)  

puts "============================================================================================================================"
puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<   Bonne chance à toi, May the 4th (c'est bientôt...) B with U   >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
puts "==========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Pour l'avenir de l'humanité....Finish them !"

while my_game.is_still_going?  #boucle tant qu'un des clan n'est pas mort, on utilise la super fonction is still going? !

	my_game.menu 
	action = gets.chomp        # on récupère la saisie du joueur !                  
	my_game.menu_choice(action)
    puts "                                                                                                                "  
    puts "                                                                                                                " 
    puts "ça y est, les tocaux (c'est le pluriel de tocards) de l'élysée t'attaquent !!!!   BOUCLIER !!!!                 " 
    my_game.enemies_attack


end

    my_game.end


binding.pry  # Maintenant c'est open bar !!