require "pry"                    

enemies = Array.new                         # fabrication de l'array contenant chaque ennemi
humanplayer = String.new                    # pour le stockage de l'info à suivre....

class Game    # class méthodes et options correspondant aux différents jeux

  attr_accessor :humanplayer, :enemies      #à mettre en en-tête de la classe

  def initialize(name)   # On lance la partie, d'office un joueur face à quatre ennemies

  	@humanplayer = HumanPlayer.new(name)   # création de l'humanplayer, avec le nom que tu veux
    player1 = Player.new("1")              # création des 4 ennemis à abbattre !
    player2 = Player.new("2")
    player3 = Player.new("3")
    player4 = Player.new("4")
    @enemies =[player1,player2,player3,player4] # concaténation des joueurs dans l'array
  end
  
  def kill_player(player)   # supprimer un player de l'array d'ennemies

   @enemies = @enemies.delete([player])

  end

  def is_still_going?   # j'ai récupérer exactement la ligne de app02 (condition de la boucle while).

    if humanplayer.life_points > 0 && enemies.empty? == false then return true  #plus simple en utilisant l'array ennemies, qu'en inscrivant la condition sur tous les joueurs.
    else return false
    end
  end

  def show_player   # écrit l'état de todo el mundo !!

    puts "#{humanplayer} a encore #{humanplayer.life_points} points de vie  "
    puts "                PAR CONTRE ....                                   "
    puts "Il reste encore #{enemies.length} ennemis en face de ta ganache BB !"
  end

  def menu  # afficher les choix.... exactement les lignes codées dans app02.rb

    puts "          Amigo !!!! Sabes que tal ?? héhé #{humanplayer.show_state}                                           "   
    puts " Bon, Mec, on a pas la vie devant nous hein ? Je te rappelle que pendant que tu branles, ils éborgnent des manifestants !!"
    puts " Alors maintenant, il s'agirait d'agir...Qu'est-ce qu'on fait ?? "
    puts "> a - Chercher une meilleure arme."
    puts "> b - Chercher à se soigner."   #jusque là ça va....

    n=0  # pour fabriquer un puts par joueur vivant, je fais une boucle sur l'array ennemies, ce qui me permet de leur attribuer un indice, et donc un gets.chomp différent !                      
    while n < @enemies.length     
    	if @enemies[n].life_points > 0 then puts "> #{@enemies[n].name} - Attaquer player#{@enemies[n].name}, qui a #{@enemies[n].life_points} point de vie" end
    	n +=1
    end
  end

  def menu_choice(action) #réagit en fonction de la saisie de l'humanplayer

       # action = gets.chomp.to_s     # on récupère la saisie du joueur mais je l'ai mis dans le app03

    if action == "a" then humanplayer.search_weapon      end   #search weapon
    if action == "b" then humanplayer.search_health_pack end   #search health

    if action !="a" && action !="b" then action = action.to_i  end
    if action !="a" && action !="b" then action -=1  end       # et oui les index ruby ça commence à 0 !
    

    if action !="a" && action !="b" then humanplayer.attacks(enemies[action]) end  # Parce que j'ai un peu triché.....        
  

#binding.pry
    if action !="a" && action !="b" && (@enemies[action].life_points <= 0) then kill_player(@enemies[action]) end  # on le tej direct !!

  end

  def enemies_attack
   
    enemies.each {|player| if player.life_points > 0 && player != nil then player.attacks(humanplayer) end}  # attaque de l'array d'ennemis un par un !

  end

  def end

    puts "                                                                                                                "  
    puts "                                                                                                                "   
    puts "<==============================================================================================================>"
    puts "          <<<<<<<<<<<<<<>>>>>>>>>>>>>>          GAME OVER            <<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>          "
    puts "<==============================================================================================================>"
      if humanplayer.life_points > 0 then
    puts " **>>>>  THX Body, grace à toi nous sommes enfin débarassé de ces énergues jupiteriennes, au plaisir d'un fight !"
      else
    puts " .... Même pas foutu de déchirer ces deux tarlouzz avec cent points de vie, des weapons ET des health_back... 
                                   GROS GROS PIGEON !!!!!   cui           cuicui                  cuicuicui ** !!!!!!!!!"
      end

  end


end