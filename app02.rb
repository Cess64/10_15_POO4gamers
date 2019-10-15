require 'bundler'   # lignes très pratiques qui appellent les gems du Gemfile.
Bundler.require

require_relative 'lib/game'  # lignes qui appellent les fichiers lib/user.rb et lib/event.rb
require_relative 'lib/player'


puts " ===>>  En direct du tatami de l'Elysée!!!!  "                        
puts " ==========>>>>>>>>>    Devant un public en feu !!!  "       
puts " ==================>>>>>>>>>    Nous te proposons un combat ethiquable, puisque non équitable !!!    "                                                                                             
puts "================================================= >>>>> >>>> >>> >> Face à MANU A.K.A. le philosophe devenu banquier !!    "
puts "===============================================================================================puis président...SHUT !!====="
puts "===================>>>>> Et son accolyte, le prêt à tout pour paraitre...j'ai nommé CriCri CasseTaMère, en crocs-chaussettes"
puts "============================================================================================================================"
puts "============================================================================================================================"

puts "Quel est ton nom, jeune moussaillon ?"
nomplayer = gets.chomp                                         # récupération du nom du human player !!
humanplayer1 = HumanPlayer.new(nomplayer)                      # on lui donne des papiers !!

puts "============================================================================================================================"
puts "<<<<<<<<<<<<<<<<<<   Bonne chance à toi cher #{humanplayer1.name}, May the 4th (c'est bientôt...) B with U   >>>>>>>>>>>>>>>>>>>>"
puts "==========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Pour l'avenir de l'humanité....Finish him !"

player1 = Player.new("Manu (El Macron)")                       # définition de l'ennemi public numéro 1
player2 = Player.new("CriCri CasseTaMère")                     # définition de l'ennemi public numero 1.5

enemies = Array.new                                            # fabrication de l'array contenant chaque ennemi
enemies = [player1,player2]                                    # remplissage de l'array ennemi !

while humanplayer1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)  #boucle tant qu'un des clan n'est pas mort
    if humanplayer1.life_points <= 0 then break end            # break end car si le humanplayer n'a plus de vies, end of the game !
    puts "          Amigo !!!! Sabes que tal ?? héhé #{humanplayer1.show_state}                                           "   
    puts " Bon, Mec, on a pas la vie devant nous hein ? Je te rappelle que pendant que tu branles, ils éborgnent des manifestants !!"
    puts " Alors maintenant, il s'agirait d'agir...Qu'est-ce qu'on fait ?? "
    puts " > A - Chercher une meilleure arme."
    puts " > B - Chercher à se soigner."
    puts " > C - Attaquer Manu El Macron, qui a #{player1.life_points} points de vie"
    puts " > D - Attaquer CriCri CasseTaMère, qui a #{player2.life_points} points de vie"
    action = gets.chomp.to_s                               # on récupère la saisie du joueur !
    if action == "a" then humanplayer1.search_weapon end
    if action == "b" then humanplayer1.search_health_pack end
    if action == "c" then humanplayer1.attacks(player1) end
    if action == "d" then humanplayer1.attacks(player2) end
    puts "                                                                                                                "  
    puts "                                                                                                                "  
    if player1.life_points <= 0 && player2.life_points <= 0 then break end  # idem break end	
    puts "ça y est, les tocaux (c'est le pluriel de tocards) de l'élysée t'attaquent !!!!   BOUCLIER !!!!                 "
    puts "                                                                                                                "  
    puts "                                                                                                                "  
     enemies.each {|player| if player.life_points > 0 then player.attacks(humanplayer1) end}  # attaque de l'array d'ennemis un par un
    
  end   # fin de la boucle du jeu Attaque/contre-attaque
    puts "                                                                                                                "  
    puts "                                                                                                                "   
    puts "<==============================================================================================================>"
    puts "          <<<<<<<<<<<<<<>>>>>>>>>>>>>>          GAME OVER            <<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>          "
    puts "<==============================================================================================================>"
      if humanplayer1.life_points > 0 then
    puts " **>>>>  THX Body, grace à toi nous sommes enfin débarassé de ces énergues jupiteriennes, au plaisir d'un fight !"
      else
    puts " .... Même pas foutu de déchirer ces deux tarlouzz avec cent points de vie, des weapons ET des health_back... 
                                   GROS GROS PIGEON !!!!!   cui           cuicui                  cuicuicui ** !!!!!!!!!"
      end



binding.pry  # Maintenant c'est open bar !!